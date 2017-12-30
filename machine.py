#!/usr/bin/env python

class Register:
    def __init__(self):
        self.zero = False
        self.negative = [False]
        self.positive = [False]
        self.pos = 0

    def __str__(self):
        p = str(self.pos) + ": "
        if self.pos == 0:
            return p + str(self.zero)
        elif self.pos < 0:
            return p + str(self.negative[self.pos * -1])
        else:
            return p + str(self.positive[self.pos])

    def  read(self):
        if self.pos == 0:
            return self.zero
        elif self.pos < 0:
            return self.negative[self.pos * -1]
        else:
            return self.positive[self.pos]

    def write(self,value):
        if self.pos == 0:
            self.zero = value
        elif self.pos < 0:
            self.negative[(self.pos * -1)] = value
        else:
            self.positive[self.pos] = value

    def left(self):
        self.pos = self.pos - 1
        if self.pos < 0:
            if len(self.negative) < ((self.pos * -1) +1):
                self.negative.append(False)

    def right(self):
        self.pos = self.pos + 1
        if self.pos > 0:
            if len(self.positive) < (self.pos +1):
                self.positive.append(False)

class Card:
    def __init__(self,number):
        self.number = number
        line = []
        with open("cards/" + str(self.number) ,'r') as f:
            for row in f:
                line.append(row[:-1])
        self.zero_write = bool(line[0])
        self.zero_move = bool(line[1])
        self.zero_next = int(line[2])
        self.one_write = bool(line[3])
        self.one_move = bool(line[4])
        self.one_next = int(line[5])

class Machine:
    def __init__(self):
        self.r = Register()
        self.card = Card(1)

    def evolve(self):
        ret = True
        if self.r.read():
            if self.card.one_move:
                self.r.left()
            else:
                self.r.right()
            self.r.write(self.card.one_write)
            if not self.card.one_next:
                ret = False
            else:
                self.card = Card(self.card.one_next)
        else:
            if self.card.zero_move:
                self.r.left()
            else:
                self.r.right()
            self.r.write(self.card.zero_write)
            if not self.card.zero_next:
                ret = False
            else:
                self.card = Card(self.card.zero_next)

        print(self.r)
        return ret


turing = Machine()
run = True
while run:
   run = turing.evolve()

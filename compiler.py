#!/usr/bin/python3

import sys
import os

filename = sys.argv[1]
dirname = sys.argv[2]
os.mkdir(dirname)

# print("Card number: " + cardnumber + ", write zero: " + write_zero + ", move zero: " + move_zero + ", next zero: " + next_zero + ", write one: " + write_one + ", move one: " + move_one + ", next one: " + next_one )
with open(filename, 'r') as ip:
    for line in ip:
        arr1 = line.split(':')
        arr2 = arr1[1].split(',')
        cardnumber = arr1[0]
        write_zero = arr2[0]
        move_zero = arr2[1]
        next_zero = arr2[2]
        write_one = arr2[3]
        move_one = arr2[4]
        next_one = arr2[5]
        

        with open(dirname + "/" + cardnumber, 'a') as op:
            op.write(write_zero + '\n')
            op.write(move_zero + '\n')
            op.write(next_zero + '\n')
            op.write(write_one + '\n')
            op.write(move_one + '\n')
            op.write(next_one + '\n')


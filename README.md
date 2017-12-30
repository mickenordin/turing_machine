# turing_machine
A simulation of a Turing machine with a two-way register and a card reader

## Operation of the turing machine
First the machine will read card one for instructions. The machine will start at registry position zero, it will read the value there (which will be zero) and write the value from the card to that registry entry, then it will move the write head in the indicated direction. After the instruction on the card has been executed it will move to the indicated next card. If that card is the zeroeth card, the machine will halt.

## The anatomy of a Card
This is an example of a one card busy beaver:
```
1
1
0 
1
0
0
````
that means
```
# If registry is zero
1 # What to write one or zero
1 # Move left for 1 move right for 0
0 # Number of next card, an int 
# If registry is one
1 # What to write one or zero
0 # Move right for 1 move left for 0
0 # Number of next card, an int
````

This means that if the registry value is 0 write a 1 to the left and then move to card zero (halt). If the registry value is 0 write a 1 to the right and then move to card zero.

That is to say that the first three rows correspond to a registry of zero and the last three rows correspond to a registry of one.

A card that will move to the left if it is zero and the right if it is one and then exit, but leave everything else in place looks like this:
```
0
1
0
1
0
0
```

## Compiler/decompiler
To make it easier to code there is a compiler and a decompiler awailable, if you have cards that you want to convert to a .tm-file you can use the decompiler:
```
./decompiler.py adder.tm cards/
```

If you have a .tm-file that you want to convert to cards, you can similarly use the compiler:
```
./compiler.py adder.tm adder
```
This will give you a stack of cards for the adder.tm program in the adder director, which will be created for you

The .tm file can have comments starting with a #-sign and empty lines with only whitespace in them

Otherwise the format of a .tm-file is this:
```
cardnumber:write_zero,move_zero,next_zero,write_one,move_one,next_one
```

For instance, the one card busy beaver would look like this:
```
# This is a comment, blank lines ar ok too, like the next line

1:1,1,0,1,0,0
````


# turing_machine
A simulation of a Turing machine with a two-way register and a card reader

## Operation of the turing machine
First the machine will read card one for instructions. The machine will start at registry position zero, it will read the value there (which will be zero) and then it will move the write head in the indicated direction and write the value from the card to that registry entry. After the instruction on the card has been executed it will move to the indicated next card. If that card is the zeroeth card, the machine will halt.

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


# Start program writes 0 at pos 0 and moves left, and jumps to 11, everything from here to 15 inputs an 8 in the negative registry
1:0,1,11,0,0,0
11:0,1,12,0,0,0
12:0,1,13,0,0,0
13:0,1,14,0,0,0
14:1,0,15,0,0,0

# At card 15 we flip a bit at registry position -4 to indicate an 8 in the negative registry, then we jump to 140
15:0,0,140,0,0,0

# At card 21 write a one and move to 22 
21:1,0,22,0,0,0

# At card 22 write a one and jump to 210 where we start to move back to registry pos 0
22:1,1,210,1,1,210

# At 30 - 38 we keep a decrementer
30:1,1,31,0,0,0
31:1,1,32,0,0,0
32:1,1,33,0,0,0
33:1,1,34,0,0,0
34:1,1,35,0,0,0
35:1,1,36,0,0,0
36:1,1,37,0,0,0
37:1,1,38,0,0,0
38:1,1,0,0,0,0

# 140 - 142 just moves us back to registry pos 0
140:0,0,141,1,0,141
141:0,0,142,1,0,142

# At 142 we jump to 21
142:0,0,21,0,0,21

# Here we move back to registry pos 0 and then jump to 30
210:0,1,211,1,1,211
211:0,1,30,1,1,30

# Start program writes 0 at pos 0 and moves left, and jumps to 11, everything from here to 15 inputs an 8 in the negative registry
1:0,1,11,0,0,0
11:0,1,12,0,0,0
12:0,1,13,0,0,0
13:0,1,14,0,0,0

# At card 14 we flip a bit at registry position -4 to indicate an 8 in the negative registry, then for completness we continue up the registry
14:1,1,15,0,0,0
15:0,1,16,0,0,0
16:0,1,17,0,0,0
17:0,1,18,0,0,0
18:0,0,107,0,0,0

# At this point we are starting to move back up the negative registry
107:0,0,106,1,0,106
106:0,0,105,1,0,105
105:0,0,104,1,0,104
104:0,0,103,1,0,103
103:0,0,102,1,0,102
102:0,0,101,1,0,101
101:0,0,100,1,0,100
100:0,0,21,1,0,21

# Move we are at the registry pos 1 where we write a 1 and move to reg pos 2
21:1,0,22,0,0,0

# A reg pos 2 we also write a one to get the binary number 3, for completeness we continue up the registry to pos 8 and then go back
22:1,0,23,0,0,0
23:0,0,24,0,0,0
24:0,0,25,0,0,0
25:0,0,26,0,0,0
26:0,0,27,0,0,0
27:0,0,28,0,0,0
28:0,1,207,0,0,0

# Now we go back to reg pos 0
207:0,1,206,1,1,206
206:0,1,205,1,1,205
205:0,1,204,1,1,204
204:0,1,203,1,1,203
203:0,1,202,1,1,202
202:0,1,201,1,1,201
201:0,1,200,1,1,200

# Here we are back to registry pos 0 where we jump to the decrementer, the idea is to decrement the negative registry
# and increment the positive registry until the negative registry is zero 
200:0,1,30,0,1,30

# This is a decrementer for registry -1 through -8
# decrement: if 1 write 0: end
#            if 0 write 1 move to next 
30:1,1,31,0,0,300
31:1,1,32,0,0,301
32:1,1,33,0,0,302
33:1,1,34,0,0,303
34:1,1,35,0,0,304
35:1,1,36,0,0,305
36:1,1,37,0,0,306
37:1,1,38,0,0,307
38:1,1,39,0,0,308

# If we get this far we have overflow and should end the program
39:1,0,510,0,0,0

# Here we need to go back to reg pos 0 after the decrementer is done
300:0,0,41,0,0,41
301:0,0,300,1,0,300
302:0,0,301,1,0,301
303:0,0,302,1,0,302
304:0,0,303,1,0,303
305:0,0,304,1,0,304
306:0,0,305,1,0,305
307:0,0,306,1,0,306
308:0,0,307,1,0,307

# Here we need to increment the positive registry
# increment: if 0 write 1: end
#            if 1 write 0 move to next
41:1,1,50,0,0,42
42:1,1,401,0,0,43
43:1,1,402,0,0,44
44:1,1,403,0,0,45
45:1,1,404,0,0,46
46:1,1,405,0,0,47
47:1,1,406,0,0,48
48:1,1,407,0,0,407

# Here we need to go back to pos 0 after the incrementer is done
401:0,1,50,1,1,50
402:0,1,401,1,1,401
403:0,1,402,1,1,402
404:0,1,403,1,1,403
405:0,1,404,1,1,404
406:0,1,405,1,1,405
407:0,1,406,1,1,406
408:0,1,407,1,1,407

# Here we jump back to the decrementer
50:0,1,30,0,1,30

# This is where we end the program, move back up the registry, to finally print bit 1-8 of the positive registry wich now holds the result
527:0,0,0,1,0,0
526:0,0,527,1,0,527
525:0,0,526,1,0,526
524:0,0,525,1,0,525
523:0,0,524,1,0,524
522:0,0,523,1,0,523
521:0,0,522,1,0,522
520:0,0,521,1,0,521
501:0,0,520,0,0,520
502:0,0,501,1,0,501
503:0,0,502,1,0,502
504:0,0,503,1,0,503
505:0,0,504,1,0,504
506:0,0,505,1,0,505
507:0,0,506,1,0,506
508:0,0,507,1,0,507
509:0,0,508,1,0,508
510:0,0,509,1,0,509

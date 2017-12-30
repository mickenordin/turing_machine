#!/usr/bin/python3

import sys
import os

filename = sys.argv[1]
dirname = sys.argv[2]
temp = []
for i in os.listdir(dirname):
    temp.append(int(i))
cards = sorted(temp)

with open(filename, 'a') as op:
    for i in cards:
        card = str(i)
        op.write(card + ":")
        with open(dirname + "/" + card, 'r') as ip:
            payload = ""
            for line in ip:
                payload = payload + line[:-1] + ','
            payload = payload[:-1]
            op.write(payload + '\n')

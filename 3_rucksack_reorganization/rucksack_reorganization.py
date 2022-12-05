from itertools import islice
from sys import path

def priority(char):
    sub = 96
    if char.isupper():
        sub = 38
    return ord(char) - sub

sum_items = 0
sum_badges = 0

list_file = path[0] + '/LIST.txt'

with open(list_file, 'r') as file:
    while True:
        lines = list(islice(file, 3))
        if not lines:
            break
        for line in lines:
            rucksack1 = line.strip()[:len(line.strip())//2]
            rucksack2 = line.strip()[len(line.strip())//2:]         
            item = ''.join(set(rucksack1).intersection(rucksack2))
            sum_items += priority(item)
        badge = ''.join(set(lines[0].strip())
                  .intersection(lines[1].strip())
                  .intersection(lines[2].strip()))
        sum_badges += priority(badge)
print(sum_items)
print(sum_badges)

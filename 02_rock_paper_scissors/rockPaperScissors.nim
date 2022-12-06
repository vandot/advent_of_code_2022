import std/[os, strutils, tables]

const scores = {"rock": 1, "paper": 2, "scissors": 3, "win": 6, "draw": 3, "lose": 0}.toTable()
const elementMap = {"A": "rock", "B": "paper", "C": "scissors", "X": "rock", "Y": "paper", "Z": "scissors"}.toTable()

proc getOutcome(elements: string): (string) =
  case elements:
    of "A Y", "B Z", "C X":
      result = "win"
    of "A X", "B Y", "C Z":
      result = "draw"
    else:
      result = "lose"

proc getElement(outcome: string): (string) =
  case outcome:
    of "A Z", "B Y", "C X":
      result = "Y"
    of "A Y", "B X", "C Z":
      result = "X"
    else:
      result = "Z"

var sum1, sum2: int

proc main() =
  var listFile = os.getAppDir() & "/LIST.txt"
  for line in lines listFile:
    var elements = line.split(' ')
    sum1 = sum1 + scores[getOutcome(line)] + scores[elementMap[elements[1]]]
    var element = getElement(line)
    sum2 = sum2 + scores[getOutcome("$# $#" % [elements[0], element])] + scores[elementMap[element]]
  echo sum1
  echo sum2

when isMainModule:
  main()

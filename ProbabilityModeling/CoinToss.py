"""
Author: Jaroslav Podmajerský
Date: 29.4.2025
"""

import random

class FSM:
    def __init__(self, prob):
        self.prob = prob
        self.state = "START"
    def run(self):
        if(self.state == "START"):
            self.state = random.choices(["H-MID","T-MID"],weights=[self.prob, 1 - self.prob])[0]
        elif(self.state == "H-MID"):
            self.state = random.choices(["START","HEAD"],weights=[self.prob, 1 - self.prob])[0]
        elif(self.state == "T-MID"):
            self.state = random.choices(["TAIL","START"],weights=[self.prob, 1 - self.prob])[0]
        elif(self.state == "HEAD"):
            return True
        elif(self.state == "TAIL"):
            return False
        return self.run()
        
fsm = FSM(0.72) #set probability to any number from 0 - 1
result = []

for _ in range(0,10**4):    #compute large
    fsm.state = "START"
    result.append(fsm.run())

print(result.count(True) / len(result))
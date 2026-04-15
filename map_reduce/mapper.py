#!/usr/bin/env python3

def mapper():
    """
    Reads in a sentence and maps the values. 
    Mapping means it will give a count of 1
    in every word in the sentence

    Words are definted if there is a space between them.
    """
def mapper():

#stdin = standard input
for line in sys.stdin:
#strip the white space at the beginning
    line = line.strip()
    line=line.replace(",", "")
    line=line.replace(".", "")
#split the line in words 
words=line.split()

for word in words:
print(word + "\t1")
sys.standout.flush()

#Process each word and assign
#a value of 1 to each word
    if __name__ == "__main__":
        mapper()
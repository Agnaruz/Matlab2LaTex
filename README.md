# Matlab 2 LaTex tool
Start by defining the class myTex = LaTex('filename')

End the code with myTex.close() - Don't skip the step!
# ---- Tools ----
myTex.write('\texCommand or just text')

myTex.begin('Command') like .begin('enumerate')

it will print out \begin{enumerate} in the file

myTex.endin('Command')

myTex.mathEQ(sym) creat a {equation}

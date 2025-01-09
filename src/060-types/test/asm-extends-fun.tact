primitive Slice;
primitive Cell;
asm(-> 1 0) extends mutates fun loadRef(self: Slice): Cell { LDREF }

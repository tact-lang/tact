asm(-> 1 0) extends mutates fun loadRef2(self: Slice): Cell {
    LDREF
}

asm fun depthTest(): Int { DEPTH }

asm(s len -> 0) fun asmLoadInt(len: Int, s: Slice): Int {
    len PUSHINT
    s DEPTH
}

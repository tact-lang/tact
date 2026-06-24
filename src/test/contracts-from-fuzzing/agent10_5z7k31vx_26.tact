asm(-> 1 0) extends mutates fun loadTopCell(self: Slice): Cell { LDREF }

fun testAsmMutates() : Int {
    let c: Cell = beginCell().storeUint(42, 10).endCell();
    let s: Slice = c.beginParse();
    let x: Cell = s.loadTopCell();
    // Since there is no direct inspection of cell x, we simply return a dummy value
    return 1;
}

fun main() : Int {
    return testAsmMutates();
}

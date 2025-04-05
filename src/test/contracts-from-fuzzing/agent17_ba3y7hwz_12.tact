contract TestCellsFixed() {
    fun test() {
        // Build a cell in two steps using Builder then converting to Cell
        let bb: Builder = beginCell();
        bb.storeUint(42, 6);     // store 42 in 6 bits
        bb.storeInt(99, 7);      // store 99 in 7 bits (signed)
        let cell: Cell = bb.endCell();
        let slice: Slice = cell.asSlice();
        let a: Int = slice.loadUint(6); // expected 42
        let b: Int = slice.loadInt(7);  // expected 99
        dump(a);
        dump(b);
    }
    receive() { self.test(); }
}

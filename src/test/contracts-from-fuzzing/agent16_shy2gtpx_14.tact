contract TestCellBuilder() {
    fun test() {
        // Build a cell with a uint and an int
        let builder: Builder = beginCell()
            .storeUint(42, 6)   // storing 42 in 6 bits
            .storeInt(-7, 8);   // storing -7 in 8 bits
        let cell: Cell = builder.endCell();
        let slice: Slice = cell.asSlice();
        let a: Int = slice.loadUint(6);
        let b: Int = slice.loadInt(8);
        dump(a); // expected output: 42
        dump(b); // expected output: -7
    }

    receive() {
        self.test();
    }
}

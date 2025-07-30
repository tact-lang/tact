contract TestCellExpr() {
    fun test() {
        // Testing cell builder expressions
        // Create a builder, store a uint and a bool, end the cell, then dump its cell representation.
        let builder: Builder = beginCell()
            .storeUint(42, 6)   // store 42 in 6 bits
            .storeBool(true);    // store true as 1-bit value
        let cell: Cell = builder.endCell();
        dump(cell);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}

contract TestCellBuilder() {
    fun run() {
        // Build a cell using a Builder, then convert to Slice and load the uint value
        let b: Builder = beginCell()
            .storeUint(42, 6);  // store 42 using 6 bits
        let c: Cell = b.endCell();
        let s: Slice = c.asSlice();
        let value: Int = s.loadUint(6);  // read the 6 bits we stored
        dump(value); // Expected output: 42
    }
    
    receive() {
        self.run();
    }
}

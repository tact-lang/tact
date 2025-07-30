contract TestCellsAndBuilders() {
    fun test() {
        // Test string conversion to Cell using asComment() which prefixes with 32 zero bits
        let cellFromString: Cell = "hello".asComment();
        let sliceFromCell: Slice = cellFromString.asSlice();
        let prefix: Int = sliceFromCell.loadUint(32);
        dump(prefix); // Expected output: 0

        // Now test Builder and Slice chain using a two-step process
        let builder: Builder = beginCell()
            .storeUint(15, 4)  // store 15 using 4 bits
            .storeBool(true);  // store a boolean true
        let builtCell: Cell = builder.endCell();
        let s: Slice = builtCell.asSlice();
        let num: Int = s.loadUint(4);
        let flag: Bool = s.loadBool();
        dump(num);  // Expected output: 15
        dump(flag); // Expected output: true
    }
    receive() { self.test(); }
}

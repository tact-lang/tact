contract TestPrimitive() {
    fun run() {
        // Testing integer arithmetic
        let a: Int = 1 + 1;         // Expect 2
        let b: Int = 3 / 2;         // Expect 1 due to floor division
        let c: Int = 42 - 10;       // Expect 32
        
        // Testing boolean operations
        let flag: Bool = true && false; // Expect false

        // Testing cell building and parsing
        let cell: Cell = beginCell()
            .storeUint(7, 3)  // store 7 using 3 bits
            .endCell();
        let slice: Slice = cell.asSlice();
        let loaded: Int = slice.loadUint(3);
        
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

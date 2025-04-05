contract BuilderTest {
    receive() {
        // Create a Builder and store a 7-bit unsigned integer (42)
        let b: Builder = beginCell().storeUint(42, 7);
        // Convert Builder to Cell
        let c: Cell = b.asCell();
        // Convert Cell to Slice
        let s: Slice = c.asSlice();
        // Load a 7-bit unsigned integer from the Slice
        let v: Int = s.loadUint(7);
        
        // Expected output: 42
        dump(v);
    }
}

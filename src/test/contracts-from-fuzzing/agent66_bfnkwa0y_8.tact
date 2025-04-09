// Test 7: Builder and Slice Usage
// This test validates the Builder and Slice primitives: creating a Cell with a Builder and then parsing it via Slice.

contract TestBuilderSlice {
    fun run() {
        let bb: Builder = beginCell()
            .storeUint(42, 6)   // storing 42 using 6 bits
            .storeBool(true);   // storing true as a single bit
        let c: Cell = bb.endCell();
        let s: Slice = c.asSlice();
        let x: Int = s.loadUint(6);  // should load back the 6 bits that encode 42
        dump(x); // Expected output: 42
    }
}

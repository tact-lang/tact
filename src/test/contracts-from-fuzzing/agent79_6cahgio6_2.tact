contract TypeTestPrimitives() {
    // This contract tests primitive types as described in the docs
    fun test() {
        // Integers
        let a: Int = 1 + 1;         // 2
        let b: Int = 3 / 2;         // Should be 1 due to floor division
        
        // Boolean operations
        let flag: Bool = true && (false || true);
        
        // Address: use myAddress to obtain current contract address
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        
        // Cells, Builders, and Slices
        let c: Cell = emptyCell();
        let builder: Builder = beginCell()
            .storeUint(42, 6)
            .storeBool(true);
        let composed: Cell = builder.endCell();
        let slice: Slice = composed.asSlice();
        let loaded: Int = slice.loadUint(6);
        
        // String literal and conversion to message cell
        let s: String = "Hello, Tact!";
        let sCell: Cell = s.asComment();
        
        // Emit outputs for off-chain observation
        dump(a);
        dump(b);
        dump(flag);
        dump(std.workchain);
        dump(loaded);
        dump(sCell);
    }

    // Main entry to trigger tests
    fun main() {
        self.test();
    }
}

// An empty contract needed for compilation
contract Dummy() {}
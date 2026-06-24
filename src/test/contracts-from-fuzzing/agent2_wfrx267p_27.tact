contract Test {
    receive() {
        // Test string variable reassignment and ensure the new value is used in subsequent operations
        let s: String = "Initial";
        s = "Reassigned";
        
        // Verify that s now equals "Reassigned"
        if (s == "Reassigned") {
            let dummy: Int = s.hashData();
        }
        
        // Test a string literal with \x00 escape sequence
        let s2: String = "Hello \x00 World";
        let slice2: Slice = s2.asSlice();
        
        // Check equality for s2
        if (s2 != "Hello \x00 World") {
            let dummy2: Int = slice2.loadUint(8);
        }
    }
}

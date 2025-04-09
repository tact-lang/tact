contract Test {
    receive() {
        // Test using an optional string and various escape sequences
        let opt: String? = null;
        
        // Assigning a string literal that contains newline, tab, double quotes, and backslash
        opt = "Optional test: \n newline, \t tab, \" doublequote, \\ backslash";
        
        // If the optional is not null, use it to trigger string processing via asSlice and hashData
        if (opt != null) {
            // Use the non-null assertion operator (!!) to get the underlying String
            let unwrapped: String = opt!!;
            let sliceRep: Slice = unwrapped.asSlice();
            let hashVal: Int = unwrapped.hashData();

            // Use equality check: compare with the expected literal
            if (unwrapped != "Optional test: \n newline, \t tab, \" doublequote, \\ backslash") {
                let trigger: Int = sliceRep.hashData() + hashVal;
            }
        }
    }
}

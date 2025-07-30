contract Test {
    receive() {
        // String literal with escape sequences for newline and tab
        let s: String = "Hello, Tact!\nNewLine and \tTab";
        
        // String literal with escaped backslash and quotes
        let s2: String = "Another string with \\ and \" quotes";
        
        // Using asSlice method on string
        let slice1: Slice = s.asSlice();
        
        // Using hashData method on string
        let hashVal: Int = s.hashData();
        
        // Use equality check between strings
        if (s != s2) {
            // Dummy use to avoid unused warnings
            let _dummy: String = s;
        }
    }
}

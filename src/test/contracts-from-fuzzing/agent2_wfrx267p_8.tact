contract Test {
    receive() {
        // Test empty string literal
        let s: String = "";
        // Check using asSlice function on empty string
        let sliceEmpty: Slice = s.asSlice();
        // Use string equality with itself
        if (s == "") {
            let dummy: Int = sliceEmpty.hashData();
        }
    }
}

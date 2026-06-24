contract TestStringEquality {
    receive() {
        // Test string equality via asSlice conversion
        let s1: String = "fuzz";
        let s2: String = "fuzz";
        let areEqual: Bool = s1.asSlice() == s2.asSlice();
    }
}

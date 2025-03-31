contract TestStringConversion {
    receive() {
        // Test conversion from String to Slice and back
        let s1: String = "Hello, Tact!";
        let slice1: Slice = s1.asSlice();
        let s2: String = slice1.asString();
        let _dummy: Bool = s1 == s2; // equality check
    }
}

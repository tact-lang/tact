contract Test {
    receive() {
        // Test conversion of string to slice and back, then equality check using the ternary operator
        let s: String = "Test conversion";
        let s2: String = s.asSlice().asString();
        // If s and s2 are equal, flag equals 1, otherwise 0
        let flag: Int = s == s2 ? 1 : 0;
        dump(flag);
    }
}

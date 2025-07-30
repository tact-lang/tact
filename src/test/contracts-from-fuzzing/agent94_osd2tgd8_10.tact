contract TestAsSlice {
    // This contract tests converting a string to a Slice using asSlice() and back to a string via asString().
    receive() {
        let s: String = "Test asSlice";
        let sliceVal: Slice = s.asSlice();
        let s2: String = sliceVal.asString();
        // Check if s and s2 are equivalent
        let eq: Bool = (s == s2);
        eq;
    }
}

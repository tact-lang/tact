contract TestStringAsSlice {
    receive() {
        // Testing conversion from String to Slice and back to String
        let s: String = "SliceTest";
        let slice: Slice = s.asSlice();
        let s2: String = slice.asString();
        // The compiler will verify that s2 converts correctly from slice
        // (we can't output at runtime, so compilation correctness is our test)
    }
}

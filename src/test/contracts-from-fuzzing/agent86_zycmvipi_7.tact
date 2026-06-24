contract TestContract {
    receive() {
        // Test String.asSlice and Slice.asString roundtrip
        let s: String = "Hello, world!";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
    }
}

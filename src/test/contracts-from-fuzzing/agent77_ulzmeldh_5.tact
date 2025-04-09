contract Test {
    receive() {
        // Test string conversion to Slice using asSlice()
        let s: String = "Immutable test";
        let slice: Slice = s.asSlice();
    }
}

contract Test {
    receive() {
        // Testing basic string literal usage
        let s: String = "Hello, TON!";
        let slice: Slice = s.asSlice();
        dump(slice);
    }
}

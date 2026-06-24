contract TestContract {
    receive() {
        let s: String = "Test123";
        let slice: Slice = s.asSlice();
        let s2: String = slice.asString();
    }
}

contract Test {
    receive() {
        let s: String = "test";
        let sl: Slice = s.asSlice();
    }
}

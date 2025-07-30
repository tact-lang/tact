contract Test {
    receive() {
        let s: String = "hello world";
        let sl: Slice = s.asSlice();
    }
}

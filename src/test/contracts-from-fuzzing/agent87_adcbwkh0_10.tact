contract Test {
    receive() {
        let s: String = "Test string for asSlice";
        let sl: Slice = s.asSlice();
    }
}

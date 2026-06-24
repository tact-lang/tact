contract Test {
    receive() {
        let s: String = "Hello, TON!";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
    }
}

contract TestStringAsSlice {
    receive() {
        let s: String = "Test string";
        let sl: Slice = s.asSlice();
    }
}

contract Test {
    receive() {
        // Testing using String.asSlice to convert a String to a Slice
        let s: String = "hello";
        let sl: Slice = s.asSlice();
    }
}

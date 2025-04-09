contract Test {
    receive() {
        let text: String = "Hello";
        let sl = text.asSlice();
        // now convert back to a string
        let text2: String = sl.asString();
    }
}

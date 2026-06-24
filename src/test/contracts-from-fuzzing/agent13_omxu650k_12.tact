contract Test {
    receive() {
        // Testing tab escape sequence in string literal
        let s: String = "Text with tab:\tend";
        dump(s);
    }
}

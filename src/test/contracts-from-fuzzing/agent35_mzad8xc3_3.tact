contract Test {
    receive() {
        // Testing escape sequence for newline \n
        let s: String = "Hello\nWorld";
        dump(s);
    }
}

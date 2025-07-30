contract Test {
    receive() {
        // Test E: Using string.asComment to obtain a Cell from a string
        let s: String = "This is a comment";
        let c: Cell = s.asComment();
        dump(c);
    }
}

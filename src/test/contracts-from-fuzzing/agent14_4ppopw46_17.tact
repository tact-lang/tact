contract TestAsComment {
    receive() {
        // Test converting a string to a Cell using asComment, which prefixes the string with four null bytes
        let s: String = "Comment test!";
        let c: Cell = s.asComment();
        dump(c);
    }
}

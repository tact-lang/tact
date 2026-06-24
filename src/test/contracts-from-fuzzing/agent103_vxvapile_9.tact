contract TestStringEquality {
    receive() {
        // Testing string equality with escape sequences (newline)
        let s1: String = "hello\nworld";
        let s2: String = "hello\nworld";
        dump(s1 == s2);
    }
}

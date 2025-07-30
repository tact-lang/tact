contract Test {
    receive() {
        let s1: String = "Hello\nWorld";
        let s2: String = "Hello\nWorld";
        if (s1 == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}

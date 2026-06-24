contract Test {
    receive() {
        let s: String = "Hello\nWorld!\tTest!\x21 \u0041 \u{42}";
    }
}

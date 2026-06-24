contract Test {
    receive() {
        // Testing escape sequences inside a string literal
        let s: String = "Line1\nLine2\tTabbed";
    }
}

contract TestCasting {
    receive() {
        let s: String = 42.toString(); // testing casting via extension method on integer literal
    }
}
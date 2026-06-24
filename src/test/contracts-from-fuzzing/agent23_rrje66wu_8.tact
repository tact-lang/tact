contract Test {
    receive() {
        // Attempt a multiline string
        let x: String = "Hello
        World";
    }
}
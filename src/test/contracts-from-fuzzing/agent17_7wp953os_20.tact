contract Test {
    receive() {
        // Attempt a multi-line string literal without explicit \n
        let multiline: String = "Line 1
Line 2";
    }
}

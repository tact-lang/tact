contract Test {
    receive() {
        // Attempt a Unicode escape
        let x: String = "Hello \u2709";
    }
}
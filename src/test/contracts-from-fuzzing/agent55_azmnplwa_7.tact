contract Test {
    receive() {
        // Test using string.hashData() extension
        let h: Int = "Test".hashData();
    }
}

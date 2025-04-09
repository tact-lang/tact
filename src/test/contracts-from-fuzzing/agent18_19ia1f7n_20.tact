contract Test {
    receive() {
        // Test the hashData() extension function on strings
        let s: String = "Test hash";
        let h: Int = s.hashData();
        dump(h);
    }
}

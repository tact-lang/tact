contract Test {
    receive() {
        // Test string concatenation using StringBuilder
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("world!");
        let s: String = b.toString();
    }
}

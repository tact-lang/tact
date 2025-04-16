contract Test {
    receive() {
        // Test string concatenation using StringBuilder.concat
        let sb: StringBuilder = beginString();
        let joined: StringBuilder = sb.concat("Hello, ").concat("world!");
        let s: String = joined.toString();
    }
}

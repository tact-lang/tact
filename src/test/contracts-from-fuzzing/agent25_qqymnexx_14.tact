contract Test {
    receive() {
        // Test string concatenation using StringBuilder.concat chaining
        let sb: StringBuilder = beginString()
            .concat("Hello, ")
            .concat("world!");
        let s: String = sb.toString();
    }
}

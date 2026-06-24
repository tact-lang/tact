contract Test {
    receive() {
        // Testing StringBuilder.concat chain for string concatenation
        let sb: StringBuilder = beginString()
            .concat("Hello, ")
            .concat("World!");
        let s: String = sb.toString();
        dump(s);  // Expected output: "Hello, World!"
    }
}

contract TestContract {
    receive() {
        // Test string concatenation using StringBuilder.concat
        let sb: StringBuilder = beginString();
        sb = sb.concat("Hello, ");
        sb = sb.concat("World!");
        let s: String = sb.toString();
    }
}

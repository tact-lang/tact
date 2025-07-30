contract Test {
    receive() {
        // Test escape sequences with hex and Unicode
        let s: String = "Hex: \x41, Unicode: \u0041, Curly Unicode: \u{1F600}";
        // Convert string to StringBuilder and back to string
        let sb: StringBuilder = beginString();
        sb.append(s);
        let s2: String = sb.toString();
    }
}

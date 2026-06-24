contract Test {
    receive() {
        // Test StringBuilder concatenation for strings
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        let s: String = sb.toString();
    }
}

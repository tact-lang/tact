contract Test {
    receive() {
        // Test: String concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        let s: String = sb.toString();
        dump(s);
    }
}

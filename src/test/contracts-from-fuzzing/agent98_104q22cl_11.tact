contract Test {
    receive() {
        // Test string concatenation using StringBuilder.append and then convert to string
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", Tact!");
        let s: String = sb.toString();
    }
}

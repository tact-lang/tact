contract Test {
    // Test string building using StringBuilder
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("World!");
        let s: String = sb.toString();
    }
}

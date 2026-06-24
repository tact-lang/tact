contract Test {
    receive() {
        // Attempt using a StringBuilder for concatenation
        let sb = beginString();
        sb.append("Hello, ");
        sb.append("World!");
        let text: String = sb.toString();
    }
}

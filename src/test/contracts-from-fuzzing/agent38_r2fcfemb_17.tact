contract Test {
    receive() {
        // Testing string concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(" ");
        sb.append("World");
        let s: String = sb.toString();
    }
}

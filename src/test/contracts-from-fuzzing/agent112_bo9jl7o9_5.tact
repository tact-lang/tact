contract Test {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("World!");
        let s: String = sb.toString();
    }
}

contract Test {
    receive() {
        // Test StringBuilder concatenation: appending two strings and converting to String
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("Tact!");
        let s: String = sb.toString();
    }
}

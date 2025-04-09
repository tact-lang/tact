contract TestStringBuilder {
    receive() {
        // Create a StringBuilder, append a string, and convert it back to a String
        let sb: StringBuilder = beginString();
        sb.append("Test");
        let s: String = sb.toString();
    }
}

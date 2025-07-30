contract TestStringBuilder {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(" ");
        sb.append("World");
        let concatenated: String = sb.toString();
    }
}
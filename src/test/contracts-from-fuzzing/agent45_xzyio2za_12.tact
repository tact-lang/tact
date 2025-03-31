contract TestStringBuilder {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("This");
        sb.append(" is");
        sb.append(" a test.");
        let s: String = sb.toString();
        dump(s);
    }
}

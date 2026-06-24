contract TestStrings {
    fun testStringBuilder(): String {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", World!");
        return sb.toString();
    }
}
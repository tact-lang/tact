fun testStringBuilder() : String {
    let sb: StringBuilder = beginString();
    sb.append("Hello, ");
    sb.append("World!\nUnicode: \u{1F60A}");
    return sb.toString();
}

contract TestStringBuilderContract {
    receive() {
        testStringBuilder();
    }
}

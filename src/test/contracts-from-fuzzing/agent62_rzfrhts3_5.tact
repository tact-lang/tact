contract StringTests {
    fun test() {
        // Test string declaration
        let str: String = "Hello, World!";
        // Test escape sequences
        let escapedStr: String = "Line1\nLine2";
        // Test concatenation using StringBuilder
        let sb: StringBuilder = beginString();
        sb.append(str);
        sb.append(" Escaped: ");
        sb.append(escapedStr);

        // Print concatenated result
        dump(sb.toString());
    }
}
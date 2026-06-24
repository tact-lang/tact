contract StringTest {
    // Test string concatenation with StringBuilder
    fun testStringBuilderConcatenation(): String {
        let sb: StringBuilder = beginString();
        sb.append("Hello, ");
        sb.append("World!");
        return sb.toString();
    }
}
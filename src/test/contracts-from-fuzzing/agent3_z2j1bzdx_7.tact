contract StringBuilderTest {
    // Test StringBuilder concatenation
    fun test(): String {
        let sb: StringBuilder = beginString();
        sb.append("Hello, "); // Append first string
        sb.append("World!"); // Append second string
        return sb.toString();
    }
}
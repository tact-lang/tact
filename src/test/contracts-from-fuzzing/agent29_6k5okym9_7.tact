contract StringTest {
    fun testStringBuilderAppend(): String {
        let b: StringBuilder = beginString();
        b.append("Hello, ");
        b.append("World!");
        return b.toString();
    }
}

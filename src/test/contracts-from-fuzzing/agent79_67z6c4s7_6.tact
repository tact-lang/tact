contract StringBuilderAppendTest {
    fun test(): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append("World!");
        return builder.toString();
    }
}
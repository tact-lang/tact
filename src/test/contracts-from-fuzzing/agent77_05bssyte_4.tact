contract TestStringBuilder {
    fun testStringBuilder(): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append("World!");
        return builder.toString();
    }
}
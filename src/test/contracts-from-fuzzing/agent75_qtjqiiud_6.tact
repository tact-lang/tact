contract TestStrings {
    fun testStringAppend(): String {
        let builder: StringBuilder = beginString();
        builder.append("Append this text.");
        return builder.toString();
    }
}
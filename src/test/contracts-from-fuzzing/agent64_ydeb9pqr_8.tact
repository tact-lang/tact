contract TestStringConcatenation {
    fun test(): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello");
        builder.append(", ");
        builder.append("World!");
        return builder.toString();
    }
}
contract TestStringBuilder {
    receive() {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append("World!");
        let result: String = builder.toString();
    }
}
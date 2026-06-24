contract ConcatWithBuilder {
    receive() {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append("Tact Builder");
        let combined: String = builder.toString();
    }
}

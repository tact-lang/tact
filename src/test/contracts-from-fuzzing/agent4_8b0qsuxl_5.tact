contract StringConcatTest {
    receive() {
        let builder = beginString();
        builder.append("Hello,");
        builder.append(" World!");
        let result = builder.toString();
    }
}
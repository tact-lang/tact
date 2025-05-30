fun buildHelloWorld(): String {
    let builder = beginString();
    builder.append("Hello ");
    builder.append("World!");
    return builder.toString();
}

contract Test {
    receive() {
        buildHelloWorld();
    }
}

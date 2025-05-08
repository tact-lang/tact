fun buildString(): String {
    let builder = beginString();
    builder.append("Hello, ");
    builder.append("Tact!");
    return builder.toString();
}

contract TestContract {
    receive() {
        let s = buildString();
    }
}

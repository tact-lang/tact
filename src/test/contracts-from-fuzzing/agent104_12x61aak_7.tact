fun testConcat(): String {
    let builder = beginString();
    builder.append("Hello, ");
    builder.append("Tact!");
    return builder.toString();
}

contract TestContract {
    receive() {
        let s: String = testConcat();
    }
}

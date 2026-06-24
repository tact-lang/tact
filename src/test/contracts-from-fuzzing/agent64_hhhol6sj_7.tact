fun testStringBuilderConcat(): String {
    let builder = beginString();
    builder = builder.concat("Hello, ");
    builder = builder.concat("world!");
    return builder.toString();
}

contract TestContract {
    receive() {
        let s = testStringBuilderConcat();
    }
}

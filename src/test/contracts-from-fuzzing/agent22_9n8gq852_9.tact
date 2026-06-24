contract Test {
    receive() {
        // We'll build a string using StringBuilder
        let result = testBuilder();
    }
}

fun testBuilder(): String {
    let sb = beginString();
    sb.append("Hello ");
    sb.append("World");
    return sb.toString();
}

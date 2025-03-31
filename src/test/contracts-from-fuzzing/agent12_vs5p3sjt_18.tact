fun testStringBuilder(): String {
    let b: StringBuilder = beginString();
    b.append("Hello ");
    b.append("Tact!");
    let r: String = b.toString();
    return r;
}

contract TestBuilder {
    receive() {
        testStringBuilder();
    }
}

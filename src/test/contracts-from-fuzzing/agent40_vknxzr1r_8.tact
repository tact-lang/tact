fun testLiteralAddress(): Bool {
    let community: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let str: String = community.toString();
    return (str != "");
}

fun main() {
    testLiteralAddress();
    return;
}

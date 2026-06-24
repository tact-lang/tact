fun testOptionalBool(b: Bool?): Bool? {
    return b;
}

contract Test {
    receive() {
        let result = testOptionalBool(true);
    }
}
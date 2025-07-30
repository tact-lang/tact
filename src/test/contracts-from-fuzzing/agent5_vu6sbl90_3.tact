fun testOptionalInt(): Int? {
    return 1;
}

contract Test3 {
    receive() {
        testOptionalInt();
    }
}

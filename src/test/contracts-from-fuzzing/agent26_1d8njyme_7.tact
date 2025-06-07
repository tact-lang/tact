fun testEqual(): Bool {
    return "a" == "a";
}

contract Test {
    receive() {
        testEqual();
    }
}

fun testReturn(): Int {
    return 42;
}

contract Test {
    receive() {
        dump(testReturn());
    }
}

fun testReturn() : Int {
    return 42;
}

contract TestReturn {
    receive() {
        dump(testReturn());
    }
}

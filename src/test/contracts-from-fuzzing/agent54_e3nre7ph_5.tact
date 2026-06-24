fun testReturn(): Int {
    return 123;
}

contract TestReturn {
    receive() {
        dump(testReturn());
    }
}

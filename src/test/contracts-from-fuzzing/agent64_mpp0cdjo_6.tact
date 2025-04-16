fun testReturn(): Int {
    return 123;
}

contract TestReturnContract {
    receive() {
        dump(testReturn());
    }
}

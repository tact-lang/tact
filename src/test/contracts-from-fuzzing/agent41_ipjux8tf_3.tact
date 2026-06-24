fun testReturn(): Int {
    return 123;
}

contract TestContract {
    receive() {
        dump(testReturn());
    }
}

fun testBooleanEquality(): Bool {
    return 3 == 3;
}

contract TestContract {
    receive() {
        testBooleanEquality();
    }
}
fun testReturn(): Int {
    return 42;
}

contract TestReturnValid {
    receive() {
       dump(testReturn());
    }
}

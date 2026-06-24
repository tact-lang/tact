fun testReturn(): Int {
    return 10;
}

contract Test {
    receive() {
       dump(testReturn());
    }
}

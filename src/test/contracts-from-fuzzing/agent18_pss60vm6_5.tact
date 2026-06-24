fun testReassignOk(): Int {
    let x: Int = 123;
    x = 124;
    return x;
}

contract Test {
    receive() {
        testReassignOk();
    }
}

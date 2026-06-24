fun testUnaryBinary(): Int {
    let x: Int = -10;
    return x + 20;
}

contract UnaryBinaryTest {
    receive() {
        testUnaryBinary();
    }
}

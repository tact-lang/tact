fun testLarge(n: Int) {
}

contract LargeTest {
    receive() {
        testLarge(9999999999999999999999999999999999999999999999999999999999999);
    }
}

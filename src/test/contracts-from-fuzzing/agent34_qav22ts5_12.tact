extends fun testExt(self: Int, _: Int): Int {
    return self + 42;
}

contract Test {
    receive() {
        dump(1.testExt(10));
    }
}

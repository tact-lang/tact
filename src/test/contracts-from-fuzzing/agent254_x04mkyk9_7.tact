fun testTernary(x: Int): Int {
    return x == 0 ? 99 : 77;
}

contract Test {
    const a: Int = testTernary(0);
    const b: Int = testTernary(1);

    receive() {}
}
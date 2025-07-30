fun testTernaryMixed2(): Int? {
    return true ? null : 2;
}

contract T {
    receive() {
        testTernaryMixed2();
    }
}

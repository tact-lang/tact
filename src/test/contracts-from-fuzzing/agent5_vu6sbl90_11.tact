fun testTernaryMixed1(): Int? {
    return true ? 1 : null;
}

contract T {
    receive() {
        testTernaryMixed1();
    }
}

fun testTernaryInference(): Int {
    return true ? 1 : 2;
}

contract T {
    receive() {
        testTernaryInference();
    }
}

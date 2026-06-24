fun testTernary(): Int {
    let x: Int? = null;
    return x != null ? x!! : 3;
}

contract TestContract {
    receive() {
        testTernary();
    }
}
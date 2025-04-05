fun testTernary(): Int {
    let x = true ? 1 : 2;
    return x;
}

contract T {
    receive() {
        testTernary();
    }
}
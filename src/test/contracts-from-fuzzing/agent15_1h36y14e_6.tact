contract Test {
    receive() {}

    get fun testTernary(): Int {
        // Ternary operator: if true, return 100; if false, return 200
        return (1 > 0) ? 100 : 200;
    }
}

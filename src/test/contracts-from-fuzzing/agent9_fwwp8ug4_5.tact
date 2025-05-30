contract Test {
    fun testTernary(): Int {
        return 1 > 2 ? 42 : 0;
    }

    receive() {
        let result: Int = self.testTernary();
        result;
    }
}

contract Test {
    fun testEarlyReturn(a: Int): Int {
        if (a < 0) {
            return -1;
        }
        return a;
    }
}

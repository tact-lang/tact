contract Test {
    fun earlyReturn(cond: Bool): Int {
        if (cond) { return 100; }
        return 200;
    }
}

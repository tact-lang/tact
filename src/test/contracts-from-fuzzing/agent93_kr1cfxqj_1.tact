contract Test {
    fun earlyReturn(a: Int): Int {
        if (a > 0) {
            return a;
        }
        return -a;
    }
}

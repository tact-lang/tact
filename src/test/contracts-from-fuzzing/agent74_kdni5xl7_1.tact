contract Test {
    fun earlyReturn(i: Int): Int {
        if (i > 0) {
            {
                return 1;
            }
        }
        return 0;
    }
}

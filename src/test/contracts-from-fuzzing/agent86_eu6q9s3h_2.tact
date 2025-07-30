contract Test {
    fun earlyReturn(i: Int): Int {
        if (i > 10) {
            {
                return 100;
            }
        }
        return 200;
    }
}

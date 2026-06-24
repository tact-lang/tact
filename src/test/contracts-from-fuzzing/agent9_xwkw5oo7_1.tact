contract Test {
    fun pos_neg(x: Int): Int {
        if (x > 0) {
            return 1;
        } else {
            return -1;
        }
    }
}

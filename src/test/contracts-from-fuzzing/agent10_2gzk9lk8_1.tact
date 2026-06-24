contract Test {
    fun test1(x: Int): Int {
        if (x > 5) {
            return x;
        }
        return -x;
    }
}

contract Test {
    fun f(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            return -x;
        }
    }
}
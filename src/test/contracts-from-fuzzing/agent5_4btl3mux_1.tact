contract Test {
    fun f(x: Int): Int {
        if (x < 0) {
            return -1;
        }
        return x;
    }
}

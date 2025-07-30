contract Test {
    fun add(a: Int, b: Int): Int {
        if (a > 0) {
            return a + b;
        } else {
            return b;
        }
    }
}
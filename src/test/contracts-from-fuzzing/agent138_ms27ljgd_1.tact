contract Test {
    fun add(x: Int, y: Int): Int {
        if (x < 0) {
            return y;
        }
        return x + y;
    }
}

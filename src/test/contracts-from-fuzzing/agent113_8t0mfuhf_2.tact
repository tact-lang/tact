contract Test {
    fun add(x: Int, y: Int): Int {
        if (x < 0) {
            return x;
        } else {
            return x + y;
        }
    }

    receive() {}
}

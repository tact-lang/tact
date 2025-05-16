contract Test {
    fun f(x: Int): Int {
        if (x > 0) {
            return x;
        }
        return 0;
    }

    receive() {}
}
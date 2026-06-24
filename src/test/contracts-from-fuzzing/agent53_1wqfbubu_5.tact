contract TestLoopReturn {
    fun loopReturn(n: Int): Int {
        repeat(n) {
            if (n == 3) {
                return n;
            }
        }
        return -1;
    }
}

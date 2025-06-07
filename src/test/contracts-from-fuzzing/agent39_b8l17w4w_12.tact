contract TestLoopReturn2 {
    receive() {}
    fun testLoop(n: Int): Int {
        repeat(n) {
            // if n is even, return half of it immediately
            if (n % 2 == 0) {
                return n / 2;
            }
        }
        // Otherwise, return n incremented by 1
        return n + 1;
    }
}

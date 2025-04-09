contract TestLoopReturn {
    fun f(x: Int): Int {
        // Loop with early return inside
        repeat (x) {
            if (x == 2) {
                return 10;
            }
        }
        return -1;
    }
}

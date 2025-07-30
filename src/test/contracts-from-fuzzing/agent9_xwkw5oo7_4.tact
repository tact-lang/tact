contract TestLoopReturn {
    fun loop_return(n: Int): Int {
        repeat(n) {
            if (n > 0) {
                return 999;
            }
        }
        return 0;
    }
}

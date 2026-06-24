contract TestLoopReturn {
    fun loopReturn(x: Int): Int {
        repeat (10) {
            if (x == 5) {
                return 42;
            }
        }
        return 99;
    }
    
    receive () {}
}

contract TestLoopReturn2 {
    fun loopReturn(a: Int): Int {
        repeat (5) {
            if(a == 3) { return 10; }
        }
        return 0;
    }
}

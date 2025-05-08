contract TestLoopReturn {
    fun loopReturnTest(): Int {
        let i: Int = 0;
        repeat (10) {
            if (i == 5) {
                return 100;
            }
            i = i + 1;
        }
        return 0;
    }
}

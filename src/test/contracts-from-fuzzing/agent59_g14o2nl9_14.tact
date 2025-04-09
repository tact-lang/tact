contract TestReturnLoopBreak {
    fun loopTest(n: Int): Int {
        let acc: Int = 0;
        repeat(n) {
            if (acc > 5) {
                return acc;
            }
            acc += 1;
        }
        return acc;
    }
}

contract TestLoop {
    fun loopTest(): Int {
        let i: Int = 0;
        repeat (5) {
            if (i == 3) {
                return i;
            }
            i = i + 1;
        }
        return -1;
    }
}

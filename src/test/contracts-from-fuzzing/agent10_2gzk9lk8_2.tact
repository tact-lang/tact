contract Test {
    fun loopReturn(): Int {
        repeat (5) {
            if (true) {
                return 42;
            }
        }
        return 0;
    }
}

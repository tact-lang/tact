contract TestLoopReturn {
    fun f(): Int {
        repeat (5) {
            if (true) {
                return 100;
            }
        }
        return 0;
    }
}

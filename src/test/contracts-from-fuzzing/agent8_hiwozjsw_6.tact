contract ReturnTestLoop {
    fun loopReturn(): Int {
        repeat (10) {
            if (1 == 1) {
                return 0;
            }
        }
        return 1;
    }

    receive () {}
}

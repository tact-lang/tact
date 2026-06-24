contract TestLoopReturn2 {
    fun testLoopReturn(): Int {
        repeat (3) {
            if (true) {
                return 123;
            }
        }
        return 456;
    }
    receive() {}
}

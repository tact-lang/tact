contract TestReturnLoop {
    fun testLoop(): Int {
        repeat (5) {
            if (true) {
                return 42;
            }
        }
        return 0;
    }

    receive () {}
}

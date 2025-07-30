contract TestReturnLoop {
    fun test(i: Int): Int {
        repeat (10) {
            if (i == 5) {
                return 42;
            }
        }
        return 0;
    }
}

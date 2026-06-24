contract TestReturnRepeat {
    fun repeatReturn(n: Int): Int {
        repeat (n) {
            return 42;
        }
        return 0;
    }

    receive () {}
}

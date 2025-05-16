contract TestReturnRegular {
    fun test(x: Int): Int {
        if (x > 0) {
            return x;
        }
        return -x;
    }
}

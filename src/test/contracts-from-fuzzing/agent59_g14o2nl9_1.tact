contract TestReturnRegular {
    fun foo(x: Int): Int {
        if (x > 10) {
            return x;
        }
        return 0;
    }
}

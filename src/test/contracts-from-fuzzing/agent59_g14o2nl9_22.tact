contract TestReturnMultiplePaths {
    fun test(x: Int): Int {
        if (x > 0) {
            return x;
        }
        if (x < 0) {
            return x * 2;
        }
        return 100;
    }
}

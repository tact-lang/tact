contract Test {
    fun testReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            if (x < 0) {
                return -x;
            } else {
                // This branch covers x == 0
                return 0;
            }
        }
    }
}

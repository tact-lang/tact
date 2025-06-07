contract Test {
    fun multiplePaths(x: Int): Int {
        if (x > 5) {
            return x;
        } else if (x < 0) {
            return -x;
        } else {
            return 0;
        }
    }
}

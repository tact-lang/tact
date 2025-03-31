contract Test {
    fun nestedComplex(x: Int): Int {
        repeat (3) {
            {
                if (x < 0) { return -1; }
            }
        }
        if (x > 0) {
            return 1;
        }
        return 0;
    }
}

contract TestNested {
    fun nested(x: Int): Int {
        if (x < 0) {
            { return 1; }
        } else if (x > 100) {
            { { return 2; } }
        }
        return 3;
    }
}

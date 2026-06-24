contract TestNested {
    fun f(x: Int): Int {
        if (x > 0) {
            { return x + 1; }
        } else {
            { return x - 1; }
        }
    }
}

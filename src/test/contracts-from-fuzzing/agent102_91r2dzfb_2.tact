contract Test1 {
    fun test(x: Int): Int {
        { if (x > 0) { return x; } }
        return 0;
    }
}

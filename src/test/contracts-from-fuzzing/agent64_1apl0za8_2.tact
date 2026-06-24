contract Test1 {
    fun f(x: Int): Int {
        if (x > 0) { return x; }
        return -x;
    }
}

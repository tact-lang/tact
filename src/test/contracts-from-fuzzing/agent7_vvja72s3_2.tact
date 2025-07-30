contract Test1 {
    receive() {}

    fun add(a: Int, b: Int): Int {
        if (a == 0) { return b; }
        return a + b;
    }
}

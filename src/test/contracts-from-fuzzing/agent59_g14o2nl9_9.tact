contract TestTernaryReturn {
    fun test(x: Int): Int {
        return x > 0 ? x + 1 : x - 1;
    }
}

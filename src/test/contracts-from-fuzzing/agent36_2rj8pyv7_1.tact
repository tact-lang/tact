contract Test1 {
    fun test(a: Int): Int {
        if (a > 0) {
            return a;
        }
        return -a;
    }
}

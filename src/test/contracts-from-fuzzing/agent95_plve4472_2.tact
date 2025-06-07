contract TestReturn1 {
    fun test(a: Int): Int {
        if (a > 5) {
            return 1;
        }
        return 0;
    }
}

contract ReturnTest1 {
    fun test(a: Int): Int {
        if (a > 0) {
            { return a * 2; }
        } else {
            { return a - 2; }
        }
    }
}

contract Test1 {
    fun earlyReturn(a: Int) : Int {
        if (a > 0) {
            return 1;
        } else {
            return -1;
        }
    }
}

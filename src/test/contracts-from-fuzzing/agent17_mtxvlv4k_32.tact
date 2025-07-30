contract Test {
    fun broken(//comment
        a: Int,
        b: Int): Int {
        return a+b;
    }
}
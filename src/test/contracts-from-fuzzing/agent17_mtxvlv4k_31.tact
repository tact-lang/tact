contract Test {
    fun broken(a: Int /* comment */, b: Int): Int {
        return a+b;
    }
}
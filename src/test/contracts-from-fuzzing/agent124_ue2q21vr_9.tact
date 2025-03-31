contract TestMultipleReturn {
    fun foo(x: Int): Int {
        if (x < 0) { return -1 }
        if (x == 0) { return 0 }
        return 1
    }
}

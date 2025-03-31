contract TestBlockReturn {
    fun blockReturn(a: Int): Int {
        {
            if (a > 10) {
                return 42;
            }
        }
        return 0;
    }
}

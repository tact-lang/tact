contract TestDeepNestedReturn {
    fun f(x: Int): Int {
        {
            if (x > 10) {
                return 1;
            } else {
                return 2;
            }
        }
    }
}

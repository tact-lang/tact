contract TestReturnFunction {
    fun test(a: Bool): Int {
        {
            if (a) {
                return 1;
            }
        }
        return 2;
    }
}

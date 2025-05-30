contract TestOptional {
    fun testOpt(flag: Bool): Int? {
        if (flag) {
            return 1;
        }
        return null;
    }
}

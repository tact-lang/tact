contract TestOptionalReturn {
    fun optReturn(flag: Bool): Int? {
        if (flag) {
            return 42;
        } else {
            return null;
        }
    }
}

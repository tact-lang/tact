contract TestOptionalReturn {
    // Function returning an optional integer
    fun optReturn(a: Int): Int? {
        if (a > 10) {
            return a;
        } else {
            return null;
        }
    }

    receive () {}
}

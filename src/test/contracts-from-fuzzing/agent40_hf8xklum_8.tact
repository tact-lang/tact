contract TestNestedReturn {
    fun testReturn2(x: Int): Int {
        // This nested block is used without a semicolon after it
        { if (x < 0) { return -x; } }
        return x;
    }

    fun testReturn1(x: Int): Int {
        if (x > 10) { return x; }
        return x + 1;
    }
}

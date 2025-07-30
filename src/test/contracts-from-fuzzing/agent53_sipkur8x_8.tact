contract TestOptionals {
    receive() {}

    // Test: returning an explicitly optional value (which is null)
    fun testOptionalNull(): Int? {
        let v: Int? = null;
        return v;
    }

    // Test: conditional optional assignment
    fun testOptionalConditional(x: Int): Int? {
        let v: Int? = x > 0 ? x : null;
        return v;
    }

    // Test: non-optional assignment with explicit value
    fun testNonOptional(x: Int): Int {
        let v: Int = x;
        return v;
    }
}

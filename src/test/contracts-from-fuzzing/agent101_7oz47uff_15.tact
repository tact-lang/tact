contract TestNonNull {
    // Test non-null assertion on an optional integer that might be non-null
    fun nonNullOk(a: Int?): Int {
        return a!! + 1;
    }

    // Test non-null assertion on a null value (will compile, potential runtime error if executed)
    fun nonNullError(): Int {
        let x: Int? = null;
        return x!!;
    }

    receive() {}
}

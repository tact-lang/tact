contract TestOptionalNonNullFail {
    receive() {
        // This test intentionally uses non-null assertion on a variable known to be null.
        // Expected: Compilation error or runtime exception with exit code 128: Null reference exception
        let a: Int? = null;
        let b: Int = a!!;
        dump(b);
    }
}

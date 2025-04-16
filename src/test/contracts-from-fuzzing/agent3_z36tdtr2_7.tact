contract TestOptionalNonNull {
    fun test() {
        // Testing non-null assertion operator on an optional type
        let opt: Int? = 5;
        dump(opt!!); // Should output 5
    }

    receive() {
        self.test();
    }
}

contract TestOptionalNonNull {
    fun test() {
        // Valid use of optionals: assign non-null value and then use non-null assertion
        let opt: Int? = 123;
        let value: Int = opt!!; // should yield 123
        dump(value);
    }

    receive() {
        self.test();
    }
}

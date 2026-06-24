contract TestOptional {
    receive() {
        // Test for optionals: initial null, then assign a non-null value, then access with non-null assertion
        let opt: Int? = null;
        opt = 123;
        dump(opt!!); // should output 123
    }
}

contract TestOptional {
    // Test: dump() with Optionals
    // Testing with an optional Int that is Some value and null
    receive() {
        let a: Int? = 42;
        dump(a);
        let b: Int? = null;
        dump(b);
    }
}

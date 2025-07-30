contract TestOptional {
    receive() {
        let a: Int? = 42;
        let b: Int = a!!; // non-null assertion operator, should yield 42
    }
}

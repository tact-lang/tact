contract TestOptionalNonNull {
    receive() {
        // Test optional-related expression and non-null assertion
        let some: Int? = 123;
        let nonnull: Int = some!!;
    }
}

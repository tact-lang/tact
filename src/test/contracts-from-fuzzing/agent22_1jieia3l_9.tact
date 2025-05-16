contract TestOptionalNonNull {
    receive() {
        let a: Int? = 42;
        let b: Int = a!!;
    }
}

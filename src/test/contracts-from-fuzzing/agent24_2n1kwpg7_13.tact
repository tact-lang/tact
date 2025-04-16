contract TestOptionalNonNull {
    receive() {
        let opt: Int? = 42;
        let x: Int = opt!!;
    }
}

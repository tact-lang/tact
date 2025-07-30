contract TestOptionalNonNull {
    receive() {
        let opt: Int? = null;
        let a: Int = opt!!;
    }
}

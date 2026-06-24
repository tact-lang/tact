contract TestOptionalNonNull {
    receive() {
        let maybe: Int? = 42;
        let assured: Int = maybe!!;
    }
}

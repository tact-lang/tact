contract TestOptionalNonNull {
    receive() {
        let maybe: Int? = 10;
        let nonNull: Int = maybe!!; // non-null assertion operator
    }
}

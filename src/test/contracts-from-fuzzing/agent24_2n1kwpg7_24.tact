contract TestOptionalNull {
    receive() {
        let opt: Int? = null;
        let x: Int = opt!!; // expecting compile-time error or runtime exception
    }
}

contract TestOptionalNonNullAssertValid {
    receive() {
        let a: Int? = 123;
        dump(a!!);
    }
}

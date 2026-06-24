contract TestOptionalNullAssertion {
    receive() {
        let opt: Int? = null;
        dump(opt!!);
    }
}

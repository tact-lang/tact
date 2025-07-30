contract TestOptionalFail {
    receive() {
        // Testing non-null assertion on a null optional
        let opt: Int? = null;
        dump(opt!!);
    }
}

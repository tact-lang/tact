contract TestOptional() {
    fun test() {
        let opt: Int? = null;
        require(opt == null, "opt is null");
        opt = 42;
        dump(opt!!);
    }
}

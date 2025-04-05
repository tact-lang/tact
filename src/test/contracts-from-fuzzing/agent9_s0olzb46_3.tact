contract TestOptionals() {
    fun test() {
        let opt: Int? = null;
        dump(opt == null); // should dump true
        opt = 123;
        dump(opt!!); // should dump 123
    }
    receive() { self.test(); }
}

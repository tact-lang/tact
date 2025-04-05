/// TestOptionalCond: Tests optional value in a conditional
contract TestOptionalCond {
    fun test() {
        let opt: Int? = 7;
        if (opt != null) {
            dump(opt!!); // should dump 7
        } else {
            dump(0);
        }
    }
    receive() { self.test(); }
}

contract TestOptionals() {
    fun test() {
        let a: Int? = null;
        if (a == null) {
            dump("a is null");
        }
        a = 255;
        dump(a!!);
    }
    receive() { self.test(); }
}

contract TestOptionalSuccess {
    fun test() {
        let a: Int? = null;
        let a2: Int? = 42;
        if (a2 != null) {
            dump(a2!!);
        }
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

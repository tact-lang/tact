contract TestOptional() {
    fun test() {
        // Test optional expressions: assignment and non-null assertion (!!)
        let a: Int? = null;
        a = 100;
        // Non-null assertion should yield 100
        dump(a!!);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}

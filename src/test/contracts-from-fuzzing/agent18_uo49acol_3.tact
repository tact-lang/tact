contract TestOptionalValid() {
    fun test() {
        // Valid usage of optional type and non-null assertion
        let op: Int? = null;
        op = 42;
        let x = op!!; // valid because op is optional and non-null now
        dump(x);
    }

    receive() {
        self.test();
    }
}

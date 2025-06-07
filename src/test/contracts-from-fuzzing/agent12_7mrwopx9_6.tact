contract TestOptional {
    fun testOptional() {
        // Testing optional literal and non-null assertion operator
        let x: Int? = 42;
        let y = x!!; // should yield 42
        dump(y);
    }

    receive() {
        self.testOptional();
    }
}

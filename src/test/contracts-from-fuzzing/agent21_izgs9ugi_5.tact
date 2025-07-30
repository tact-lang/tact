contract TestNullAndSelf {
    fun showcase() {
        // Testing the null literal and non-null assertion operator
        let a: Int? = null;
        // Using a ternary-like if expression with null check
        let b = a == null ? 42 : a!!;
        b;
        // Using self literal; should refer to the current contract instance
        self;
    }

    receive() {
        self.showcase();
    }
}

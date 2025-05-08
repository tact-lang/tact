contract TestReturnExpr {
    fun get42(): Int {
        return 42;
    }

    receive() {
        // Using the function call via self
        let value: Int = self.get42();

        // Using an inline function call as part of a more complex expression
        let result: Int = (value + 8) * (self.get42() - 2);
    }
}

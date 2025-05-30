contract TestSelfLiteral() {
    // Define a contract-level constant
    const MY_CONST: Int = 42;

    fun test() {
        // Testing the 'self' literal by accessing a contract-level constant
        dump(self.MY_CONST);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}

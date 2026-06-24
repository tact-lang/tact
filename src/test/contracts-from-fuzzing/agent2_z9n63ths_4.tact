contract BooleanAndSelfExprTest {
    const TEST_CONST: Int = 42;

    fun test() {
        // Testing boolean literals
        dump(true);  // Expected to print true
        dump(false); // Expected to print false

        // Testing self literal via field access to a contract-level constant
        dump(self.TEST_CONST); // Expected to print 42
    }

    receive() {
        self.test();
    }
}

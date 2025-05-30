contract TestSelfLiteral() {
    // Testing 'self' literal usage to access a contract-level constant
    const MY_CONST: Int = 1234;

    fun run() {
         // 'self.MY_CONST' should resolve to the constant value 1234
         dump(self.MY_CONST);
    }

    receive() {
         self.run();
    }
}

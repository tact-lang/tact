contract TestSelfExpressions {
    const MY_CONST: Int = 42;

    fun test() {
         // Testing self literal for accessing a contract-level constant
         dump(self.MY_CONST); // expected output: 42
    }

    receive() {
         self.test();
    }
}

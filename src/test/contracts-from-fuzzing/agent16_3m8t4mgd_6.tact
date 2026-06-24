contract TestSelf() {
    const MY_CONST: Int = 123;
    fun test() {
        // Testing 'self' literal and 'null' literal expressions
        dump(self.MY_CONST); // expected output: 123
        dump(null);         // expected output: null representation
    }
    receive() {
        self.test();
    }
}

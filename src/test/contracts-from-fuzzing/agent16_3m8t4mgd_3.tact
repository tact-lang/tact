contract TestBoolean() {
    fun test() {
        // Testing boolean literals and logical operators
        dump(true);          // expected: true
        dump(false);         // expected: false
        dump(!true);         // expected: false
        dump(true && false); // expected: false
        dump(true || false); // expected: true
    }
    receive() {
        self.test();
    }
}

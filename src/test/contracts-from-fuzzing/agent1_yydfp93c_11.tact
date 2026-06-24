contract TestBoolean {
    // This function tests the precedence of logical operators
    // Expected evaluation: false || (true && false) -> false || false -> false
    fun test_logic(): Bool {
         return false || true && false;
    }

    receive() {
         dump(self.test_logic());
    }
}

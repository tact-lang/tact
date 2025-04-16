contract TestExpressions() {
    fun run() {
         // Testing arithmetic expressions
         let a = (10 - 2) * 3 + 1; // Expected: (8 * 3) + 1 = 24 + 1 = 25
         dump(a);
    }
    receive() {
         self.run();
    }
}

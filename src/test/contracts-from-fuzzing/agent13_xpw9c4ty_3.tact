contract BooleanExprTest() {
    fun test() {
        // Evaluate a boolean expression: (true || false) && !false
        // Expected result: true, because (true || false) is true, and !false is true
        let b = (true || false) && !false;
        dump(b);
    }

    receive() {
        self.test();
    }
}

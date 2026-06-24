contract TestBoolean() {
    fun test() {
        // Testing boolean literals and logical operators, including the not operator and the ternary operator.
        // The expression (true && !false) ? 111 : 222 should evaluate to 111.
        dump((true && !false) ? 111 : 222);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}

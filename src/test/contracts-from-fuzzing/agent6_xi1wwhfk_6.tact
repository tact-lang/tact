contract TestTernary() {
    fun test() {
        // Testing ternary operator associativity
        // According to Tact documentation, the ternary operator is right-associative.
        // Therefore, the following expressions should evaluate as:
        // Expression A: false ? 1 : (false ? 2 : 3)  ==> 3
        // Expression B: false ? 1 : (true ? 2 : 3)   ==> 2
        // We combine them: A * 10 + B = 3*10 + 2 = 32
        let exprA = false ? 1 : (false ? 2 : 3);
        let exprB = false ? 1 : (true ? 2 : 3);
        dump(exprA * 10 + exprB);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}

contract TestConstExpr {
    // Evaluate a constant expression using addition with a compile-time function
    // 42 + ton("0.5") should equal 42 + 500,000,000 = 500000042
    const CONST_SUM: Int = 42 + ton("0.5");

    receive() {
        require(self.CONST_SUM == 500000042, "constant sum evaluation failed");
        dump(self.CONST_SUM);
    }
}

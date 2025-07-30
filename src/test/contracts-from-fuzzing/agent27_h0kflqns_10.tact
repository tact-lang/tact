contract TestPrecedence {
    // Test constant precedence: multiplication has higher precedence than addition
    // Expected: 1 + (2 * 3) = 7
    const PRE: Int = 1 + 2 * 3;

    receive() {
        require(self.PRE == 7, "precedence evaluation failed");
        dump(self.PRE);
    }
}

contract TestArithmeticExpressionConstant {
    const RESULT: Int = 2 * 3 + 5 - 1; // Expected 2*3=6, +5=11, -1=10

    receive() {
        if (self.RESULT == 10) {
            return;
        }
    }
}

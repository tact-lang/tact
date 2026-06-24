contract TestArithmeticConstant {
    const SUM: Int = 1 + 2;

    receive() {
        if (self.SUM == 3) {
            return;
        }
    }
}

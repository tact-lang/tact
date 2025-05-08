contract ConstEvalTest2 {
    // Test a constant expression combining arithmetic and bitwise operators
    // According to documentation, the constant MOON_RADIUS_KM in MyContract is defined as:
    // 1730 + (8 | 8), which should evaluate to 1730 + 8 = 1738.
    const MOON_RADIUS: Int = 1730 + (8 | 8);

    fun test() {
         require(self.MOON_RADIUS == 1738, "MOON_RADIUS constant evaluation failed");
    }

    receive() {
         self.test();
         cashback(sender());
    }
}

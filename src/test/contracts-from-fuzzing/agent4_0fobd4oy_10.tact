contract DivisionTest {
    fun testDiv() {
        // Test division rounding behavior: division should round toward -∞ as in Python's // operator.
        // For -3/2, mathematical result is -1.5, and rounding toward -∞ yields -2.
        let res: Int = -3 / 2;
        dump(res); // Expected output: -2
    }

    receive() {
        self.testDiv();
    }
}

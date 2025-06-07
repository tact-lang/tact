contract TestDivRounding {
    receive() {
        // In Tact, division rounds toward -∞. So -3/2 should equal -2.
        let result: Int = -3 / 2;
        require(result == -2, "Division rounding error: -3/2 should equal -2");
    }
}

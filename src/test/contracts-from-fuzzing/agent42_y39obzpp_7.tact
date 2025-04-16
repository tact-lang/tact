contract TestIntDivision {
    fun test() {
        // Division rounding: 3/2 should equal 1, and (-3)/2 should equal -2 since it rounds toward -∞
        let pos: Int = 3 / 2;      // expected 1
        let neg: Int = -3 / 2;     // expected -2
        dump(pos);
        dump(neg);
    }

    // Dummy receive function to force contract inclusion
    receive() { cashback(sender()); }
}

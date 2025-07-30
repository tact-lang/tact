contract TestDivisionRounding {
    fun run() {
        // According to documentation, division rounds toward -∞ (floor division).
        let a: Int = 3 / 2;   // expected 1, because 1.5 rounds down to 1
        let b: Int = -3 / 2;  // expected -2, because -1.5 rounds down to -2
        dump(a);
        dump(b);
    }
    receive() {}
}

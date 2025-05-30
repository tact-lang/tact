contract TestDivisionModulo {
    receive() {
        // Test division rounding and modulo as per Tact specification
        let posDiv: Int = 6 / 5;   // 6/5 should be 1 (truncated division)
        let negDiv: Int = -6 / 5;  // -6/5 should be -2 (rounding toward -∞)
        let modPos: Int = 6 % 5;   // expected 1, since 6 = 1*5 + 1
        let modNeg: Int = -6 % 5;  // expected 4, because -6 = (-2)*5 + 4
        dump(posDiv);
        dump(negDiv);
        dump(modPos);
        dump(modNeg);
    }
}

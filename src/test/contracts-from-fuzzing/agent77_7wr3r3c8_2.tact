contract Test {
    receive() {
        // Test integer division rounding behavior
        let a: Int = -5;
        let b: Int = 2;
        dump(a / b); // expected: rounding away from zero? Documentation states truncation towards 0 if positive, away if negative. Check: -5 / 2 = -3 because division of negative should round away from zero

        // Test positive division
        let c: Int = 5;
        let d: Int = 2;
        dump(c / d); // expected: 2
    }
}

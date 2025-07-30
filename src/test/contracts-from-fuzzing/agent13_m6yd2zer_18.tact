contract TestDivNeg {
    receive() {
        let d: Int = -10 / 3;      // expected: -3 if truncating towards zero
        let m: Int = -10 % 3;      // expected: -1 if using truncating remainder
        dump(d);
        dump(m);
    }
}

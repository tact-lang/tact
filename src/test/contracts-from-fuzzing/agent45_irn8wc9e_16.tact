contract TestModulo {
    receive() {
        // Modulo operator tests
        let a: Int = 1 % 5;    // expected 1
        let b: Int = -1 % 5;   // expected 4, since modulo has same sign as divisor
        let c: Int = 1 % -5;   // expected -4
        let d: Int = -1 % -5;  // expected -1
    }
}

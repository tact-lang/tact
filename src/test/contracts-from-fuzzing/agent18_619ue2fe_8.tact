contract TestModulo {
    receive() {
        let m1: Int = 1 % 5;   // expected: 1
        let m2: Int = -1 % 5;  // expected: 4
        let m3: Int = 1 % -5;  // expected: -4
        let m4: Int = -1 % -5; // expected: -1
    }
}

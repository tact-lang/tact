contract TestDivisionModulus {
    fun test() {
        // Test arithmetic division rounds toward -∞
        let a = 3 / 2;    // expected: 1
        let b = -3 / 2;   // expected: -2
        
        // Test modulo operator behavior
        let mod1 = 1 % 5;   // expected: 1
        let mod2 = 1 % -5;  // expected: -4

        dump(a);
        dump(b);
        dump(mod1);
        dump(mod2);
    }

    receive() {
        self.test();
    }
}

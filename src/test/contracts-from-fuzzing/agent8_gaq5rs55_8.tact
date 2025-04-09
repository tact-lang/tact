contract ExprBitwise {
    fun test() {
        let five = 5;
        // Negation of five: -5
        dump(-five); // expected: -5
        
        // Bitwise NOT of five: ~5: expected: -6
        dump(~five); // expected: -6
        
        // -(~five): expected: 6
        dump(-(~five)); // expected: 6
        
        // ~(-five): expected: 4
        dump(~(-five)); // expected: 4
    }

    receive() {
        self.test();
    }
}

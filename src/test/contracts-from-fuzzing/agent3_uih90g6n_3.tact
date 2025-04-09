contract TestOperators {
    receive() {
        // Test operator precedence and associativity
        let a: Int = 1 + 2 * 3;   // expected 1 + (2*3) = 7
        let b: Int = (1 + 2) * 3; // expected (1+2)*3 = 9
        let c: Int = 10 - 2 - 3;  // expected (10 - 2) - 3 = 5
        let d: Int = 10 - (2 - 3); // expected 10 - (-1) = 11
        
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}

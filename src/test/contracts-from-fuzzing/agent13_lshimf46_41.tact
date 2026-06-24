contract TestMathExpressions {
    receive() {
        // Test built-in mathematical functions from Tact core
        // sign: returns 1 if positive, 0 if zero, -1 if negative
        dump(sign(42));         // Expected output: 1
        dump(sign(-42));        // Expected output: -1
        dump(sign(0));          // Expected output: 0

        // sqrt: computes square root and rounds to the nearest integer
        dump(sqrt(4));          // Expected: 2
        dump(sqrt(3));          // Expected: 2
        dump(sqrt(2));          // Expected: 1
        dump(sqrt(1));          // Expected: 1
        dump(sqrt(0));          // Expected: 0

        // divc: rounded-up division example
        dump(divc(3, 2));       // Expected: 2
        dump(divc(-3, 2));      // Expected: -1
    }
}

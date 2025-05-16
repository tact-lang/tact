contract TestArithmeticOperators {
    receive() {
        // Arithmetic operator tests
        let a: Int = 5 + 3;      // Addition
        let b: Int = 10 - 2;     // Subtraction
        let c: Int = 4 * 7;      // Multiplication
        let d: Int = 20 / 4;     // Division
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}

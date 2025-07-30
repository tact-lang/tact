contract TestBinaryOperators {
    receive() {
        let addition: Int = 40 + 2;
        let subtraction: Int = 45 - 3;
        let multiplication: Int = 7 * 6;
        let division: Int = 42 / 7; // Expected: 6
        let modulo: Int = 42 % 5;   // Expected: 2
    }
}

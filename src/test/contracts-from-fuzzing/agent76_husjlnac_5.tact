contract TestBinaryOperators {
    receive() {
        // Testing addition
        let addition: Int = 5 + 3;
        // Testing subtraction
        let subtraction: Int = 10 - 4;
        // Testing multiplication
        let multiplication: Int = 3 * 7;
        // Testing division
        let division: Int = 20 / 5;
        // Testing modulo
        let modulo: Int = 17 % 3;

        dump(addition);
        dump(subtraction);
        dump(multiplication);
        dump(division);
        dump(modulo);
    }
}

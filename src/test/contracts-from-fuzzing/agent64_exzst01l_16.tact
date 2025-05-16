contract TestArithmeticPrecedence2 {
    receive() {
        // Operator precedence: multiplication and division bind stronger than addition and subtraction
        // Calculation: 1 + 2 * 3 - 4 / 2 = 1 + 6 - 2 = 5
        let result: Int = 1 + 2 * 3 - 4 / 2;
        dump(result);
    }
}

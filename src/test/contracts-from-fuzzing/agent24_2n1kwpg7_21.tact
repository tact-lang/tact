contract TestOperatorPrecedence {
    receive() {
         // Precedence: multiplication and division bind tighter than addition and subtraction
         // Expected: 1 + (2*3) - (4/2) = 1 + 6 - 2 = 5
         let v: Int = 1 + 2 * 3 - 4 / 2;
    }
}

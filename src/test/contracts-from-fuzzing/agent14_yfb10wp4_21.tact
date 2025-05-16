contract TestArithmetic {
    receive() {
         // Testing binary arithmetic operators
         dump(6 * 7);      // Multiplication: Expected 42
         dump(42 / 7);     // Division: Expected 6
         dump(5 % 2);      // Modulo: Expected 1
    }
}

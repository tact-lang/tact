contract TestOperators {
    receive() {
        let a = -123;         // Unary minus
        let b = !false;       // Unary logical not
        let add = 5 + 7;        // Addition
        let sub = 10 - 2;       // Subtraction
        let mul = 3 * 4;        // Multiplication
        let div = 20 / 4;       // Division
        let mod = 10 % 3;       // Modulo
    }
}

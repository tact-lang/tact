contract TestInvalidUnaryPlus {
    receive() {
        // Attempting to use unary plus operator, which should be invalid
        let x: Int = +5;
    }
}

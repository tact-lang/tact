contract TestUnaryPlusError {
    receive() {
        // Testing unsupported unary plus operator
        let a: Int = +42;
    }
}

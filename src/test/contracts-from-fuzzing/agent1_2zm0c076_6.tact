contract TestUnaryOperators {
    receive() {
        // Testing unary minus on an integer literal
        let neg: Int = -42;
        // Testing unary plus (if allowed); if not, this might be a no-op
        let pos: Int = +42;
        // Testing logical not on a boolean literal
        let notTrue: Bool = !true;
    }
}

contract TestUnary {
    receive() {
        // Testing unary operators
        let a: Int = 10;
        let neg: Int = -a;        // unary minus
        let not: Bool = !true;    // logical not

        return;
    }
}

contract TestUnary {
    receive() {
        // Unary operators test: plus, minus, and logical not
        let pos: Int = +42;    // unary plus (if supported)
        let neg: Int = -42;    // unary minus
        let flag: Bool = !false;  // logical NOT
        dump(pos);
        dump(neg);
        dump(flag);
    }
}

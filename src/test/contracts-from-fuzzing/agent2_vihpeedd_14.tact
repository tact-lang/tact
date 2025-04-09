contract TestUnary {
    receive() {
        let a: Int = -5;          // unary minus
        let b: Bool = !true;        // logical inversion
        let c: Int = ~42;          // bitwise NOT: ~42 should equal -43 (assuming two's complement)
    }
}

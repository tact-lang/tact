contract TestUnaryOps {
    receive() {
        // Logical NOT operator
        let not_val: Bool = !false;  // expected to yield true
        
        // Unary minus operator
        let neg_val: Int = -42;      // expected to yield -42
    }
}

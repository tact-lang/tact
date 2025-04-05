contract TestUnaryOps {
    receive() {
        // Unary minus
        let a: Int = -42;
        let b: Int = -(-5); // should result in 5

        // Logical not
        let c: Bool = !true;  // false
        let d: Bool = !false; // true

        // Bitwise NOT
        let e: Int = ~42;     // expected: -43, since ~42 == -(42+1)
        let f: Int = ~(-43);  // expected: 42
    }
}

contract TestUnaryOperators {
    receive() {
        let a: Int = -(-10);      // expected to yield 10
        let b: Bool = !true;       // expected to yield false
        let c: Int = ~42;          // bitwise NOT of 42
    }
}

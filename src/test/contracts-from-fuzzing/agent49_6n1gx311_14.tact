contract TestLogicalOperators {
    receive() {
        // Testing binary logical AND, OR and unary NOT operators
        let a: Bool = true && false;         // Expected: false
        let b: Bool = true || false;          // Expected: true
        let c: Bool = !(false || false);      // Expected: true
        dump(a);
        dump(b);
        dump(c);
    }
}

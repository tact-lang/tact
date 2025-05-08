contract TestLogicalOperators {
    receive() {
        // Logical binary operators tests
        let a: Bool = true;
        let b: Bool = false;
        dump(a && b);  // expected false
        dump(a && a);  // expected true
        dump(a || b);  // expected true
        dump(b || b);  // expected false
    }
}

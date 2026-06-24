contract TestLogicalOperators {
    receive() {
        let a: Bool = true && false; // expected false
        let b: Bool = false || true; // expected true
        let c: Bool = (true || false) && false; // expected false
        dump(a);
        dump(b);
        dump(c);
    }
}

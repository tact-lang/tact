contract TestBooleanLiteral {
    receive() {
        let a: Bool = true;
        let b: Bool = false;
        dump(a);      // expected: true
        dump(b);      // expected: false
        dump(!a);     // expected: false
        dump(!b);     // expected: true
    }
}

contract TestUnaryBoolean {
    receive() {
        let flag: Bool = true;
        let inv: Bool = !flag;       // expected: false
        let doubleInv: Bool = !(!flag); // expected: true
        dump(inv);
        dump(doubleInv);
    }
}

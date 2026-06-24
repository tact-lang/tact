contract TestBoolLiterals {
    receive() {
        let a: Bool = true;
        let b: Bool = false;
        dump(a);
        dump(b);
    }
}
contract TestBooleanNot {
    receive() {
        let a: Bool = true;
        let b: Bool = !a; // logical NOT
        dump(b);
    }
}

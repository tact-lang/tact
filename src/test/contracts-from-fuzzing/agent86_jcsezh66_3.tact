contract TestBooleanLiteral {
    receive() {
        let a: Bool = true;
        let b: Bool = false;
        let c: Bool = a && b;
        let d: Bool = a || b;
    }
}

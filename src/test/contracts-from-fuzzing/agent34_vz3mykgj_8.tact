contract TestUnaryInverse {
    receive() {
        let a: Bool = !true;
        let b: Bool = !false;
        let c: Bool = !!true;
    }
}

contract TestUnaryInverse {
    receive() {
        let a: Bool = !true;
        let b: Bool = !(!false);
    }
}

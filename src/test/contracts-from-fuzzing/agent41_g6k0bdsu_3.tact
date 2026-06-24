contract TestLiteralBool {
    receive() {
        let b: Bool = true;
        let c: Bool = false;
        dump(b);
        dump(c);
    }
}

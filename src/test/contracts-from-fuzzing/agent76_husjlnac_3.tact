contract TestLiteralBool {
    receive() {
        let a: Bool = true;
        let b: Bool = false;
        dump(a);
        dump(b);
    }
}

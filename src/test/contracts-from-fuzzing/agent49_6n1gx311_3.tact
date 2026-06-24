contract TestLiteralBool {
    receive() {
        // Boolean literal expression test
        let t: Bool = true;
        let f: Bool = false;
        dump(t);
        dump(f);
    }
}

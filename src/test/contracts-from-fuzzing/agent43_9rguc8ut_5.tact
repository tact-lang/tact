contract TestUnary {
    receive() {
        let a: Int = -42;
        let b: Bool = !false;
        dump(a);
        dump(b);
    }
}

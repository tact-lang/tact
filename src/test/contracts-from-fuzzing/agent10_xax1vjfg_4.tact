contract TestUnaryNegate {
    receive() {
        let a: Int = -42;
        dump(a);
    }
}
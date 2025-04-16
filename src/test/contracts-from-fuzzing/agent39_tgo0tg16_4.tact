contract TestUnaryMinus {
    receive() {
        let a: Int = -(-1);
        dump(a);
    }
}

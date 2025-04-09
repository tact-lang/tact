contract TestUnaryMinus {
    receive() {
        let a: Int = -123;
        dump(a);
    }
}

contract TestUnaryInt {
    receive() {
        let a: Int = -42;
        let b: Int = -(-42);
    }
}

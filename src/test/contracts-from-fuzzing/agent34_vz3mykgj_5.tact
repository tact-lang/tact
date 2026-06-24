contract TestUnaryNegate {
    receive() {
        let a: Int = -5;
        let b: Int = -(-10);
    }
}

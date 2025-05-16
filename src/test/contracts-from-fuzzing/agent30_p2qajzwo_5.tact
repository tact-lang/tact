contract TestUnaryNegate {
    receive() {
        let x: Int = -(-1);
        x;
    }
}

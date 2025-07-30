contract TestUnaryBitwiseNot {
    receive() {
        let x: Int = ~42;
        x;
    }
}

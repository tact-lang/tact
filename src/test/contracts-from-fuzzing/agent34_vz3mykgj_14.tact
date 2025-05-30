contract TestUnaryBitwiseNot {
    receive() {
        let a: Int = ~42;    // should equal -43
        let b: Int = ~(~42); // should equal 42
    }
}

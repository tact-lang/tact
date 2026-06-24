contract Test {
    receive() {
        // Testing unary plus operator usage. According to documentation, unary plus should not exist as a unary operator.
        let a: Int = +5;
    }
}

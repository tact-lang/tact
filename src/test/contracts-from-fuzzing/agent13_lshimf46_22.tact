contract TestMultipleUnary {
    receive() {
        // Test multiple consecutive unary minus operators: -(-(-1)) should equal -1
        let a: Int = ---1;
        dump(a);
    }
}

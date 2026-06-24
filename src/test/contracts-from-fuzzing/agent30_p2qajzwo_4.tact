contract TestLiteralAddress {
    receive() {
        let a: Address = address("0:1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef");
        a;
    }
}

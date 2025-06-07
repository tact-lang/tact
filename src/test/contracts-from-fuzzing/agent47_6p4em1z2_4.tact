// TestLiteral_IntHex: Testing hexadecimal integer literal
contract TestLiteral_IntHex {
    receive() {
        let a: Int = 0xFF;
        dump(a.toString());
    }
}

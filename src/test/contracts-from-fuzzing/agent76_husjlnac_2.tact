contract TestLiteralInt {
    receive() {
        let a: Int = 42;
        let b: Int = 0xABC;
        let c: Int = 0o777;
        let d: Int = 0b1010;
    }
}

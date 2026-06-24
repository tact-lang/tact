contract TestArithmeticSubtractionChain {
    receive() {
        let a: Int = 5 - -3; // expected: 8
        dump(a.toString());
    }
}

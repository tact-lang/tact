contract TestOptionalArithmetic {
    receive() {
        let opt: Int? = 10;
        let result: Int = opt!! + 5; // expected: 15
    }
}

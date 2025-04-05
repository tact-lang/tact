contract TestBinaryComparisons {
    receive() {
        let eq: Bool = (10 == 10);
        let neq: Bool = (10 != 5);
        let lt: Bool = (10 < 20);
        let gt: Bool = (10 > 20);
        let le: Bool = (10 <= 10);
        let ge: Bool = (20 >= 21);
    }
}

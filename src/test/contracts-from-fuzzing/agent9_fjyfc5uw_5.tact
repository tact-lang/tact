contract TestBinaryOperators {
    receive() {
        let sum: Int = 2 + 3;
        let prod: Int = 4 * 5;
        let diff: Int = 10 - 8;
        dump(sum);  // expected 5
        dump(prod); // expected 20
        dump(diff); // expected 2
    }
}

contract TestAssignment {
    init() {}
    receive() {
        let value: Int = 5;
        value = 10;
        value += 5; // should be equivalent to value = value + 5
        dump(value); // expected output: 15
    }
}

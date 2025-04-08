struct Inner {
    i: Int;
    b: Bool;
}

contract Test {
    testField: Inner;

    init() {
        self.testField = Inner{i: 5, b: true};
    }
}
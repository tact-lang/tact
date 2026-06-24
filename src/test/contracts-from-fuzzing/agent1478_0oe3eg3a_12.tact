struct IntOptions {
    a: Int?;
    b: Int?;
    c: Int;
}

contract OptsAndRawInt {
    state: IntOptions;
    init() {
        self.state = IntOptions{ a: null, b: 5, c: 99 };
    }
}

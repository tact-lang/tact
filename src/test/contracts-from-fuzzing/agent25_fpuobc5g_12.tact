struct Inner {
    foo: Int;
    bar: Bool;
}

contract Test {
    one: Inner;
    two: Inner;
    three: Inner;
    four: Inner;
    five: Inner;
    init() {
        self.one = Inner{ foo: 1, bar: true };
        self.two = Inner{ foo: 2, bar: false };
        self.three = Inner{ foo: 3, bar: true };
        self.four = Inner{ foo: 4, bar: false };
        self.five = Inner{ foo: 5, bar: true };
    }
}
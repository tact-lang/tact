struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    one: Inner;
    two: Inner;
    three: Inner;

    init() {
        self.one = Inner{ a: 1, b: null };
        self.two = Inner{ a: 2, b: true };
        self.three = Inner{ a: 3, b: false };
    }
}
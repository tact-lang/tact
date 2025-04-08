struct Inner {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ foo: 1, bar: null };
    }
}
struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{ foo: 1, bar: true };
    }
}
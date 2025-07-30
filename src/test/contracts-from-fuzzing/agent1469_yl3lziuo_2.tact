struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ foo: 10, bar: true };
    }

    receive() {}
}
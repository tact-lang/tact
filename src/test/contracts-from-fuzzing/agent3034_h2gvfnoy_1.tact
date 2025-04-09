struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: Inner;
    bar: Int = 5;

    init() {
        self.foo = Inner{ a: 1, b: true };
    }
}
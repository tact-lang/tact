struct Inner { nested: Int; }

contract TestContract {
    foo: Inner;

    init() {
        self.foo = Inner{ nested: 42 };
    }
}
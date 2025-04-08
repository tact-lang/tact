struct Inner { foo: Int; bar: Bool; }

contract TestContract {
    nested: Inner = Inner{ foo: 1, bar: true };

    init() {
        self.nested = Inner{ foo: 2, bar: false };
    }
}
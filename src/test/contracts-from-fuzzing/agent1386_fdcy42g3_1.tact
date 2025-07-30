struct Inner {
    value: Int;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ value: 42 };
    }
}
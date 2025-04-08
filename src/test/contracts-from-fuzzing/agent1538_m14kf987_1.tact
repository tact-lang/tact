struct Inner {
    innerVal: Int;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ innerVal: 123 };
    }
}
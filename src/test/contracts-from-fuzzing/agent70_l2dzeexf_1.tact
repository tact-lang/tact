struct Inner {
    x: Int;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ x: 1 };
    }
}
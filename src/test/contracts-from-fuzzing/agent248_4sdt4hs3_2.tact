struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{ x: 42, y: true };
    }
}
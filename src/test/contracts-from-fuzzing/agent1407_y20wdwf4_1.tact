struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field: Inner;

    init() {
        self.field = Inner{ a: 1, b: true };
    }
}
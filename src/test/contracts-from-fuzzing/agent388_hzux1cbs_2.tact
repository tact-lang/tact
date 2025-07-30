struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOneLevel {
    field: Inner;

    init() {
        self.field = Inner{ a: 5, b: false };
    }
}
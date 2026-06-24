struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    nested: Inner;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.nested = Inner{ a: 10, b: false };
    }
}

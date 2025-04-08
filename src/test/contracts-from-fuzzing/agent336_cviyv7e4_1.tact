struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Inner;

    init() {
        self.field1 = 10;
        self.field2 = true;
        self.field3 = Inner{ a: 5, b: false };
    }
}
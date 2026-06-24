struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nestedInner: Inner;
    nullableInner: Inner?;
    flag: Bool;
    number: Int;

    init() {
        self.nestedInner = Inner{ a: 1, b: true };
        self.nullableInner = null;
        self.flag = false;
        self.number = 42;
    }
}
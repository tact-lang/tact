struct Inner {
    foo: Int?;
}

contract OptStructFieldOptional {
    s: Inner?;

    init() {
        self.s = Inner{ foo: 123 };
    }
}
struct Inner {
    a: Int;
    b: Int?;
}

contract OptionalStructFieldOptional {
    foo: Inner?;

    init() {
        self.foo = Inner{ a: 1, b: null };
    }
}
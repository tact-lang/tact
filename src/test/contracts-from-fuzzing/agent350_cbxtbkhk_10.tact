struct Inner {
    foo: Int;
}

contract OptionalFieldContract {
    data: Inner?;

    init() {
        self.data = Inner{ foo: 123 };
    }
}
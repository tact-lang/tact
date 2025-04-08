struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructOfOptionals {
    nested: Inner?;

    init() {
        self.nested = Inner{ foo: null, bar: true };
    }
}
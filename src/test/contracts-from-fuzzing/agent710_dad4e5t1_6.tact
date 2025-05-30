struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: OptionalNested = OptionalNested{ nested: null };

    init() {
        self.data = OptionalNested{ nested: Inner{ foo: 1, bar: true } };
    }
}
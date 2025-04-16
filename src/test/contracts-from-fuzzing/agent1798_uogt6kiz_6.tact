struct OptionalNested {
    foo: Int?;
    bar: String?;
    nested: Inner?;
}

struct Inner {
    baz: Bool;
}

contract OptionalFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: null,
            bar: null,
            nested: null
        };
    }
}
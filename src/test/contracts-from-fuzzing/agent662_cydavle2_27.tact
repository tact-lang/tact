contract NestedOptionalStructDefault {
    s: OptionalNested = OptionalNested{
        foo: null,
        bar: null,
        nested: null
    };
    init() {
        self.s = OptionalNested{
            foo: 5,
            bar: true,
            nested: null
        };
    }
}

struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}
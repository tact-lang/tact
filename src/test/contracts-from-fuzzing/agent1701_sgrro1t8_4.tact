struct OptionalNested {
    foo: Int?;
    bar: Int?;
    nested: InnerOpt?;
}

struct InnerOpt {
    baz: Int?;
    qux: Int?;
}

contract OptionalNest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: null,
            bar: null,
            nested: null
        };
    }
}
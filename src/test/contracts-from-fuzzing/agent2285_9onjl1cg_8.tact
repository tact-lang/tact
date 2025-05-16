struct OptionalNest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Test8 {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            foo: null,
            bar: null,
            baz: null,
            nested: null,
        };
    }
}
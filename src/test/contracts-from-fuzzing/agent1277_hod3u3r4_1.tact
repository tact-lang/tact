struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    nested: Inner;
    c: String;
    d: Int?;
}

contract NestedOptionalsTest {
    field: Outer;

    init() {
        self.field = Outer {
            nested: Inner {
                a: 1,
                b: null,
            },
            c: "test",
            d: null,
        };
    }
}

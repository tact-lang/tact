struct NestedOpts {
    foo: Int?;
    bar: Bool?;
    nested: InnerNested?;
}

struct InnerNested {
    x: Int;
    y: String?;
}

contract NestedOptionalsTest {
    dat: NestedOpts;

    init() {
        self.dat = NestedOpts{
            foo: null,
            bar: null,
            nested: InnerNested{
                x: 42,
                y: null,
            },
        };
    }
}

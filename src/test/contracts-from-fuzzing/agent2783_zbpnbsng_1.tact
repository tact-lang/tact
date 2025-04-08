struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    inner: InnerNested;
    y: Bool;
}

contract DeepNesting {
    nestedField: OuterNested;

    init() {
        self.nestedField = OuterNested{
            inner: InnerNested{
                a: 5,
                b: true,
            },
            y: false,
        };
    }
}

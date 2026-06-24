contract ForwardRefContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            value: 10,
            nested: InnerNested{ x: 1, y: null }
        };
    }
}

struct InnerNested {
    x: Int;
    y: Int?;
}

struct OuterNested {
    value: Int;
    nested: InnerNested;
}

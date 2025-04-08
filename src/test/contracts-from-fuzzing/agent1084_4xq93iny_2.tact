struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    x: InnerNested;
    y: Int?;
}

contract NestedStructField {
    point: OuterNested;

    init() {
        self.point = OuterNested{
            x: InnerNested{
                a: 1,
                b: true,
            },
            y: null,
        };
    }
}
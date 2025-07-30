struct InnerNested {
    x: Int;
    y: Int?;
}

struct OuterNested {
    nested: InnerNested;
    flag: Bool;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{ x: 1, y: null },
            flag: true,
        };
    }
}
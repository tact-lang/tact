struct InnerNested {
    x: Int;
    y: String?;
}

struct OuterNested {
    first: Bool;
    second: InnerNested;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            first: true,
            second: InnerNested{
                x: 42,
                y: "foo",
            },
        };
    }
}
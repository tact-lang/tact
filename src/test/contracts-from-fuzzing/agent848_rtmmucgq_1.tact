struct InnerNested {
    foo: Int;
    bar: Bool?;
}

struct OuterNested {
    nested: InnerNested;
    text: String;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{
                foo: 1,
                bar: true,
            },
            text: "hello",
        };
    }
}
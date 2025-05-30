struct InnerNested {
    x: Int;
    y: Bool;
}

struct OuterNested {
    nested: InnerNested;
    s: String;
    f: Bool?;
}

contract NestTest {
    data: OuterNested;
    init() {
        self.data = OuterNested{
            nested: InnerNested{
                x: 10,
                y: false,
            },
            s: "hello",
            f: null,
        };
    }
}

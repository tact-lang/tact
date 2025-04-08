struct InnerLevel {
    x: Int;
    y: Bool?;
}

struct MidLevel {
    foo: InnerLevel;
    bar: String?;
}

struct TopLevel {
    m: MidLevel;
    n: Bool;
}

contract NestedStructStorage {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            m: MidLevel{
                foo: InnerLevel{
                    x: 42,
                    y: null,
                },
                bar: "hello",
            },
            n: true,
        };
    }
}

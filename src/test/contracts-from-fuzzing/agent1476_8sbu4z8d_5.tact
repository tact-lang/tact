struct InnerNested {
    a: Int;
    opt: Bool?;
}

struct MiddleLevel {
    nested: InnerNested;
    word: String;
}

struct OuterMost {
    middle: MiddleLevel;
    extra: Int;
}

contract MultiNestedPersistent {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: MiddleLevel{
                nested: InnerNested{
                    a: 42,
                    opt: null,
                },
                word: "hello",
            },
            extra: 99,
        };
    }
}
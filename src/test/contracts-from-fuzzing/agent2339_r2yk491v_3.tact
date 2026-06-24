struct InnerNested {
    a: Int;
    b: Bool;
}

struct MiddleNested {
    c: String;
    d: InnerNested;
}

struct OuterNested {
    e: MiddleNested;
    f: Int;
}

contract DeepNestedStructStorage {
    s: OuterNested;

    init() {
        self.s = OuterNested{
            e: MiddleNested{
                c: "test",
                d: InnerNested{
                    a: 7,
                    b: true
                }
            },
            f: 42
        };
    }
}

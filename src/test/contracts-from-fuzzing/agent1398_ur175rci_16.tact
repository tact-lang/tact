struct InnerNested {
    x: Int;
    text: String;
}

struct MiddleNested {
    in1: InnerNested;
    in2: InnerNested;
}

struct OuterNested {
    mid: MiddleNested;
    extra: Bool;
}

contract DeepWideStorage {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            mid: MiddleNested{
                in1: InnerNested{ x: 11, text: "foo" },
                in2: InnerNested{ x: 22, text: "bar" }
            },
            extra: true
        };
    }
}
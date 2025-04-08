struct InnerLevel {
    a: Int;
    b: Bool;
    c: String;
}

struct MiddleLevel {
    x: Int;
    optionalInner: InnerLevel?;
}

contract DeepNested {
    field: MiddleLevel;

    init() {
        self.field = MiddleLevel{
            x: 5,
            optionalInner: InnerLevel{
                a: 10,
                b: true,
                c: "hi",
            },
        };
    }
}

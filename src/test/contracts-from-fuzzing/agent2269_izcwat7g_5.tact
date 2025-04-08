struct InnerLevel {
    x: Int;
}

struct MiddleLevel {
    a: Int;
    inner: InnerLevel;
}

struct OuterLevel {
    middle: MiddleLevel;
    y: Int?;
}

contract ThreeNestedStructs {
    nested: OuterLevel;

    init() {
        self.nested = OuterLevel{
            middle: MiddleLevel{
                a: 2,
                inner: InnerLevel{x: 1}
            },
            y: null
        };
    }
}

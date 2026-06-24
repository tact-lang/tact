struct InnerMost {
    info: String;
}

struct MiddleLayer {
    inner: InnerMost;
    flag: Bool;
}

struct OuterLayer {
    middle: MiddleLayer;
    count: Int;
}

contract DeepNested {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            middle: MiddleLayer{
                inner: InnerMost{ info: "Nested info 🚀" },
                flag: true
            },
            count: 123
        };
    }
}
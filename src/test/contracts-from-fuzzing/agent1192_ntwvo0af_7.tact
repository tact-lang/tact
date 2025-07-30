struct InnerLayer {
    s: String;
    n: Int;
}

struct MiddleLayer {
    flag: Bool;
    opt: InnerLayer?;
}

struct OuterLayer {
    middle: MiddleLayer;
    name: String;
}

contract DeepNestContract {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            middle: MiddleLayer{
                flag: true,
                opt: InnerLayer{
                    s: "deep",
                    n: 42
                }
            },
            name: "outer"
        };
    }
}
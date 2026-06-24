struct InnerLayer {
    x: Int;
    flag: Bool;
    s: String;
}

struct MiddleLayer {
    inner: InnerLayer;
    optInt: Int?;
}

struct OuterLayer {
    mid: MiddleLayer;
    text: String;
    boolVal: Bool;
}

contract ThickNest {
    everything: OuterLayer;
    init() {
        self.everything = OuterLayer{
            mid: MiddleLayer{
                inner: InnerLayer{
                    x: 4,
                    flag: true,
                    s: "innermost",
                },
                optInt: null,
            },
            text: "out",
            boolVal: false,
        };
    }
}
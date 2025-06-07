struct InnerLayer {
    flag: Bool;
}

struct MiddleLayer {
    text: String;
    nested: InnerLayer;
}

struct OuterLayer {
    opt: Int?;
    innerMid: MiddleLayer;
}

contract DeepContainer {
    stored: OuterLayer;
    init() {
        self.stored = OuterLayer{
            opt: null,
            innerMid: MiddleLayer{
                text: "hi",
                nested: InnerLayer{ flag: true }
            }
        };
    }
}
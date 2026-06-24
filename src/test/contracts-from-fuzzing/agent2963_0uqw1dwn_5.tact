struct DeepOptionalChain {
    id: Int;
    maybeName: String?;
    maybeFlag: Bool?;
    maybeInner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
    z: String?;
}

contract DeepOptionals {
    stuff: DeepOptionalChain?;

    init() {
        self.stuff = DeepOptionalChain{
            id: 1,
            maybeName: "hi",
            maybeFlag: true,
            maybeInner: Inner{
                x: 2,
                y: null,
                z: "ok"
            }
        };
    }
}

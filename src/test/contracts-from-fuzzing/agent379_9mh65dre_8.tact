struct InnerLayer {
    content: String;
    flag: Bool;
}

struct MiddleLayer {
    innerOpt: InnerLayer?;
    count: Int;
}

struct OuterLayer {
    middle: MiddleLayer;
    label: String?;
}

contract MixedOptionalPersistence {
    state: OuterLayer;

    init() {
        self.state = OuterLayer{
            middle: MiddleLayer{
                innerOpt: null,
                count: 77,
            },
            label: null,
        };
    }
}
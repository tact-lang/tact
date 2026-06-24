struct LargeOptionalInner {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
    x8: Int?;
    x9: Int?;
    x10: Int?;
}

struct LargeOptionalOuter {
    nested: LargeOptionalInner?;
}

contract OptionalLargeInner {
    storage: LargeOptionalOuter;

    init() {
        self.storage = LargeOptionalOuter{
            nested: null
        };
    }
}
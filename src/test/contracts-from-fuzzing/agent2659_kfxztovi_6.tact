struct OptionalNestedInner {
    maybeInt: Int?;
    maybeBool: Bool?;
}

struct OptionalNestedOuter {
    inner1: OptionalNestedInner?;
    inner2: OptionalNestedInner?;
}

contract OptionalNestedStorage {
    storage: OptionalNestedOuter;

    init() {
        self.storage = OptionalNestedOuter{
            inner1: null,
            inner2: OptionalNestedInner{
                maybeInt: null,
                maybeBool: true,
            },
        };
    }
}
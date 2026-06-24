struct NestedOptionalInner {
    valA: Int;
    valB: Bool;
    optInt: Int?;
}

struct NestedOptionalOuter {
    optInner: NestedOptionalInner?;
    optFlag: Bool?;
}

contract TestContract {
    stored: NestedOptionalOuter;

    init() {
        self.stored = NestedOptionalOuter{
            optInner: null,
            optFlag: null
        };
    }
}
struct InnerLevel {
    id: Int;
    note: String;
}

struct MiddleLevel {
    optInner: InnerLevel?;
}

contract NestedOptionalInner {
    nested: MiddleLevel;

    init() {
        self.nested = MiddleLevel{
            optInner: null
        };
    }
}
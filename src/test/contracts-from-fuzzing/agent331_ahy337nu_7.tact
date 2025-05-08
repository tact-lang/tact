struct InnerMost {
    value: Int;
}

struct MidLevel {
    nested: InnerMost;
}

struct TopLevel {
    mid: MidLevel?;
}

contract OptionalInMiddle {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            mid: null
        };
    }
}
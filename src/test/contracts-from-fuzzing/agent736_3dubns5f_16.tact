struct InnerMostOpt {
    x: Int;
    y: Bool;
}

struct MiddleLevel {
    a: InnerMostOpt?;
    b: String?;
}

struct TopLevel {
    m: MiddleLevel;
    flag: Bool;
}

contract NestedComplexOptional {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            m: MiddleLevel{ a: null, b: null },
            flag: true
        };
    }
}
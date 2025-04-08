struct LowerLevel {
    optStr: String?;
    optInt: Int?;
    optBool: Bool?;
}

struct HigherLevel {
    low: LowerLevel?;
    normalField: Int;
}

contract OptionalNestedStructs {
    nestedOpt: HigherLevel?;

    init() {
        self.nestedOpt = HigherLevel{
            low: LowerLevel{ optStr: null, optInt: null, optBool: null },
            normalField: 99
        };
    }
}
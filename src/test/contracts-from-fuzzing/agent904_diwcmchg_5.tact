struct InnerMost {
    flag: Bool;
}

struct Middle {
    innermost: InnerMost;
    optionalFlag: Bool?;
}

struct OuterMost {
    middle: Middle;
    optionalText: String?;
}

contract OptionalNest {
    field: OuterMost;

    init() {
        self.field = OuterMost{
            middle: Middle{
                innermost: InnerMost{ flag: true },
                optionalFlag: null
            },
            optionalText: null
        };
    }
}
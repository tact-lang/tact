struct InnerMost {
    x: Int;
}

struct Middle {
    i: InnerMost;
}

struct MiddleOpt {
    m: Middle?;
}

contract ComplexOptionalNest {
    field: MiddleOpt;

    init() {
        self.field = MiddleOpt{
            m: Middle{
                i: InnerMost{ x: 5 }
            }
        };
    }
}

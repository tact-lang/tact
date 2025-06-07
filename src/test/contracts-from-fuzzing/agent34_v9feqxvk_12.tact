struct InnerS {
    sval: Int?;
}

struct MiddleS {
    nested: InnerS;
}

struct OuterS {
    nested: MiddleS;
}

contract NullsDefault {
    s: OuterS;

    init() {
        self.s = OuterS{
            nested: MiddleS{
                nested: InnerS{
                    sval: null
                }
            }
        };
    }
}
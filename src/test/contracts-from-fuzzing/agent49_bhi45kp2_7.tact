struct InnerSoDeep { deepField: Int; }

struct MiddleLevel {
    inner: InnerSoDeep;
    innerOpt: InnerSoDeep?;
}

struct Outer {
    middle: MiddleLevel;
}

contract NestingContract {
    field: Outer;

    init() {
        self.field = Outer{
            middle: MiddleLevel{
                inner: InnerSoDeep{ deepField: 42 },
                innerOpt: null
            }
        };
    }
}
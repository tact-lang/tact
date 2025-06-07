struct InnerMost {
    x: Int;
    y: Bool;
}

struct MiddleOpt {
    optInner: InnerMost?;
    flagOpt: Bool?;
}

struct OuterOpt {
    middleOpt: MiddleOpt?;
    numOpt: Int?;
}

contract NestedOptionals {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt{
            middleOpt: null,
            numOpt: null,
        };
    }
}
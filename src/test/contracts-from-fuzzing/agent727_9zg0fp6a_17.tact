struct InnerMost {
    x: Int;
}

struct InnerOpt {
    nested: InnerMost?;
}

struct OuterMost {
    middle: InnerOpt?;
}

contract OptOptOpt {
    root: OuterMost;

    init() {
        self.root = OuterMost{
            middle: InnerOpt{
                nested: InnerMost{x: 123}
            }
        };
    }
}
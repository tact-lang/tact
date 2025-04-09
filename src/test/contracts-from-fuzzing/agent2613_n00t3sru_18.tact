struct InnerMost {
    x: Int;
}

struct InnerOpt {
    v: InnerMost?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract DoubleOptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null
        };
    }
}
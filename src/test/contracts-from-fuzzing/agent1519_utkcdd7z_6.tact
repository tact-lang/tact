struct InnerMost {
    f: Int;
}

struct InnerOuter {
    inner: InnerMost;
}

contract Contr {
    nested: InnerOuter?;

    init() {
        self.nested = InnerOuter{
            inner: InnerMost{
                f: 42
            }
        };
    }
}

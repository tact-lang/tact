struct Outermost {
    s1: InnerMost;
    optInner: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract OptionalInsideOptional {
    s: Outermost;
    init() {
        self.s = Outermost{
            s1: InnerMost{val:1},
            optInner: null
        };
    }
}

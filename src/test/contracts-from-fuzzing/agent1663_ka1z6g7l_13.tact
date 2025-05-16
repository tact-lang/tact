struct InnerMost {
    flag: Bool?;
}

struct InnerMiddle {
    nested: InnerMost;
}

struct InnerOuter {
    inner: InnerMiddle?;
}

contract OptionalDeep {
    data: InnerOuter;

    init() {
        self.data = InnerOuter{
            inner: null
        };
    }
}
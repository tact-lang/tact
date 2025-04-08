struct InnerMostOpt {
    i: Int?;
    b: Bool?;
}

struct MidOpt {
    inner: InnerMostOpt?;
}

struct OuterOpt {
    x: Int;
    mid: MidOpt?;
}

contract OptionalNested {
    nested: OuterOpt;

    init() {
        self.nested = OuterOpt{
            x: 5,
            mid: MidOpt{
                inner: InnerMostOpt{
                    i: null,
                    b: true,
                },
            },
        };
    }
}
struct InnerOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract Test11 {
    nested: OuterOpt;

    init() {
        self.nested = OuterOpt{
            mid: MidOpt{
                inner: InnerOpt{
                    val: 7,
                },
            },
        };
    }
}
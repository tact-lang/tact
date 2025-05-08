struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract Test {
    nested: OuterOpt;

    init() {
        self.nested = OuterOpt{
            mid: null,
        };
    }
}
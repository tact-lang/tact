struct InnerMost {
    a: Int?;
}

struct MidLevel {
    im: InnerMost?;
}

struct OuterMost {
    ml: MidLevel?;
}

contract OptionalsChain {
    field: OuterMost?;

    init() {
        self.field = null;
    }
}
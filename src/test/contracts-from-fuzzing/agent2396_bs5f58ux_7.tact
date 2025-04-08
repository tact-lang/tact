struct InnerOpt {
    val: Int?;
}

struct MiddleOpt {
    inside: InnerOpt?;
}

struct OuterOpt {
    mid: MiddleOpt?;
}

contract OptChain {
    holder: OuterOpt;

    init() {
        self.holder = OuterOpt{ mid: null };
    }
}

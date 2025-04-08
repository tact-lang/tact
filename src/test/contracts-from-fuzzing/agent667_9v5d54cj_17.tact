struct InnerMostOpt {
    val: Int?;
}

struct MidOpt {
    mid: InnerMostOpt?;
}

struct OuterOpt {
    outer: MidOpt?;
}

contract OptionalCascade {
    opt: OuterOpt?;

    init() {
        self.opt = null;
    }
}

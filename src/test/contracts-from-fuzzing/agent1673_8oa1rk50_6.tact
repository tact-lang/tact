struct InnerS {
    a: Int;
}

struct MiddleS {
    inr: InnerS;
}

struct OuterS {
    mid: MiddleS;
}

contract NullDeepOpt {
    val: OuterS?;

    init() {
        self.val = null;
    }
}
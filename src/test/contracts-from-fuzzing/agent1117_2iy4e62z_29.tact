struct InnerMost {
    f: Bool;
    s: String;
}

struct InnerOuter {
    f: Bool;
    s: String;
    inr: InnerMost;
}

contract StructOptNest {
    opt: InnerOuter?;

    init() {
        self.opt = null;
    }
}

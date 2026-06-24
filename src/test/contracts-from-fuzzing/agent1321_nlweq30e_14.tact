struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct OuterMost {
    mid: Mid;
    midOpt: Mid?;
}

contract Deeply {
    st: OuterMost;

    init() {
        self.st = OuterMost{
            mid: Mid{ inner: InnerMost{val:1}, optInner:null },
            midOpt: null
        };
    }
}
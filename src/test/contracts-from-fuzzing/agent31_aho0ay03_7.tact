struct SInnerMost {
    x: Int;
}

struct SInner {
    innerMost: SInnerMost;
}

struct SMid {
    inner: SInner;
}

struct SOuter {
    mid: SMid;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{mid: SMid{inner: SInner{innerMost: SInnerMost{x:1}}}};
    }
}

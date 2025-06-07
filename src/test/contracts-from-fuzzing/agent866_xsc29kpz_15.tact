struct SOpt {
    inner: Int?;
}

struct SDouble {
    f1: SOpt;
    f2: SOpt;
}

contract Holder {
    s: SDouble;
    init() {
        self.s = SDouble{
            f1: SOpt{ inner: null },
            f2: SOpt{ inner: null }
        };
    }
}
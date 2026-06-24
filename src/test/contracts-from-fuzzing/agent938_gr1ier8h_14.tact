struct SInner {
    optionalVal: Int?;
    flag: Bool;
}

struct SOuter {
    inn1: SInner;
    inn2: SInner?;
}

contract OptionalMix {
    field: SOuter;

    init() {
        self.field = SOuter{
            inn1: SInner{ optionalVal: 1, flag: true },
            inn2: null,
        };
    }
}

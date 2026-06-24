struct SInner {
    a: Int;
}

struct SOuter {
    inner1: SInner;
    inner2: SInner;
    optInner: SInner?;
}

contract NestedStructsAndOptional {
    data: SOuter;
    init() {
        self.data = SOuter{
            inner1: SInner{a:1},
            inner2: SInner{a:2},
            optInner: null
        };
    }
}
struct SInner {
    a: Int;
}

struct SOuter {
    inner1: SInner;
    inner2: SInner;
}

contract Test {
    d: SOuter;
    init() {
        self.d = SOuter{
            inner1: SInner{a: 5},
            inner2: SInner{a: 10}
        };
    }
}
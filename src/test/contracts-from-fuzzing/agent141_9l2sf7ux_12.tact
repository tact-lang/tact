struct SInner {
    val: Int;
}

struct SOuter {
    inner1: SInner;
    inner2: SInner;
    inner3: SInner;
    inner4: SInner;
}

contract MultipleStructSameType {
    outer: SOuter;

    init() {
        self.outer = SOuter{
            inner1: SInner{val:1},
            inner2: SInner{val:2},
            inner3: SInner{val:3},
            inner4: SInner{val:4}
        };
    }
}
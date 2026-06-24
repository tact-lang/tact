struct SInner {
    val: Int;
    flag: Bool;
}

struct SOuter {
    inner1: SInner;
    inner2: SInner;
    flag: Bool;
}

contract StructOfStructs {
    s: SOuter;

    init() {
        self.s = SOuter{
            inner1: SInner{ val: 1, flag: true },
            inner2: SInner{ val: 2, flag: false },
            flag: true
        };
    }
}

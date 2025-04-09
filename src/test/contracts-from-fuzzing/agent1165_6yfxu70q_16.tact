struct SInner {
    value: Int;
}

struct SOuter {
    val1: Int;
    val2: Int;
    inner: SInner;
    val3: Int;
}

contract MiddleStruct {
    data: SOuter;

    init() {
        self.data = SOuter{ val1: 10, val2: 20, inner: SInner{ value: 30 }, val3: 40 };
    }
}

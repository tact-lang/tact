struct SInner {
    val: Int;
}

struct SMiddle {
    optInner: SInner?;
}

struct SOuter {
    middle: SMiddle?;
}

contract NestedOptOptContract {
    data: SOuter;

    init() {
        self.data = SOuter{middle: null};
    }
}
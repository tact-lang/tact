struct BoolNest {
    inner1: BoolInner;
    inner2: BoolInner;
}

struct BoolInner {
    x: Bool;
    y: Bool;
}

contract TestContract {
    data: BoolNest;

    init() {
        self.data = BoolNest{
            inner1: BoolInner{ x: true, y: false },
            inner2: BoolInner{ x: false, y: true },
        };
    }
}
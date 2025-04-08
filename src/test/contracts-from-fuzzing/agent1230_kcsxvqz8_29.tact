struct IntBoolNest {
    x: Int;
    y: Bool;
}

struct DoubleNest {
    xx: IntBoolNest;
    yy: IntBoolNest;
}

contract NestedTwice {
    f: DoubleNest;

    init() {
        self.f = DoubleNest{
            xx: IntBoolNest{ x: 1, y: true },
            yy: IntBoolNest{ x:2, y:false }
        };
    }
}
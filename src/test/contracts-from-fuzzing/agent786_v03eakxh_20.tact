struct BoolNest {
    a: Bool;
    b: Bool;
}

struct IntNest {
    x: Int;
    y: Int;
    inner: BoolNest;
}

contract NestedDifferentTypes {
    data: IntNest;

    init() {
        self.data = IntNest{
            x: 7,
            y: 8,
            inner: BoolNest{
                a: true,
                b: false
            }
        };
    }
}
struct DeepNest {
    field1: Int;
    optInner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
    z: Leaf?;
}

struct Leaf {
    flag: Bool;
    value: Int?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            field1: 1,
            optInner: null,
        };
    }
}
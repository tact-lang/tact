struct Leaf {
    z: Int;
}

struct Inner {
    v: Bool;
    leaf: Leaf;
}

struct Outer {
    id: Int;
    maybeInner: Inner?;
}

contract PartialOptNested {
    data: Outer;

    init() {
        self.data = Outer{
            id: 99,
            maybeInner: null
        };
    }
}
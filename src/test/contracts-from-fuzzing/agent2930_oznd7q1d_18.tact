struct Inner {
    x: Int;
    y: Int;
}

struct HasTwoInner {
    i1: Inner;
    i2: Inner;
}

contract NestedSameStructs {
    hs: HasTwoInner;

    init() {
        self.hs = HasTwoInner{
            i1: Inner{x: 1, y:2},
            i2: Inner{x: 3, y:4}
        };
    }
}

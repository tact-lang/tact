struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    innerMost: InnerMost;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract NestedStructsStorage {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            inner: Inner{
                y: 2,
                innerMost: InnerMost{
                    z: 3
                }
            }
        };
    }
}
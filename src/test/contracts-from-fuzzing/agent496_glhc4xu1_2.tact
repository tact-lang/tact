struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int?;
    innerMost: InnerMost;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract TestNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            inner: Inner{
                y: null,
                innerMost: InnerMost{
                    z: 3
                }
            }
        };
    }
}
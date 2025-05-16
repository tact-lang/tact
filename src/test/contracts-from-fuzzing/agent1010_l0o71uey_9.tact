struct SubInner {
    z: Int;
}

struct Inner {
    y: Int;
    sub: SubInner;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract MultiLayerStruct {
    field: Outer;
    init() {
        self.field = Outer{
            x: 2,
            inner: Inner{
                y: 3,
                sub: SubInner{ z: 4 },
            },
        };
    }
}
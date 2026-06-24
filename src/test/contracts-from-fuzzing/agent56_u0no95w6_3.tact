struct Inner {
    y: Int;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ y: 123 },
            z: 456,
        };
    }
}
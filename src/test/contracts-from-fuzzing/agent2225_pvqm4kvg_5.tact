struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner?;
    z: Int;
}

contract OptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            z: 77
        };
    }
}
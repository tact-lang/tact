struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract DeepNestedStorage {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{ x: 10, y: 20 },
            z: 30
        };
    }
}
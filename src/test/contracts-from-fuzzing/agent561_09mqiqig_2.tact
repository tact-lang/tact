struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Inner?;
    z: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            z: 42,
        };
    }
}
struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 1, y: 2 },
            z: 3,
        };
    }
}
struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: null },
        };
    }
}
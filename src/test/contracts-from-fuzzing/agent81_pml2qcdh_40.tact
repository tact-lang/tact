struct Inner {
    s: String?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    f: Outer;

    init() {
        self.f = Outer{
            inner: Inner{ s: null }
        };
    }
}
struct InnerMost {
    val1: Int;
    val2: String?;
}

struct Inner {
    im: InnerMost?;
    b: Bool;
}

struct Outer {
    inner: Inner?;
    a: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: null,
            a: 42
        };
    }
}
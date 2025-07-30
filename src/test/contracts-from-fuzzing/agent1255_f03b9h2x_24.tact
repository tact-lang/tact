struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test24 {
    data: Outer?;

    init() {
        self.data = null;
    }
}
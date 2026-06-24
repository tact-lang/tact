struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepDefaultNest {
    f: Outer?;

    init() {
        self.f = null;
    }
}
struct Inner {
    a: Int;
}

struct Outer {
    maybe_inner: Inner?;
}

contract Test {
    f: Outer;
    init() {
        self.f = Outer{ maybe_inner: null };
    }
}
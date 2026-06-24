struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Bool;
}

contract TestContract {
    maybe: Outer?;

    init() {
        self.maybe = null;
    }

    receive() {
        if (self.maybe != null) {
            let _ = self.maybe!!.inner.a;
            let _ = self.maybe!!.b;
        }
    }
}
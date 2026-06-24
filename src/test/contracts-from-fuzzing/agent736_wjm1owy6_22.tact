struct OuterMost {
    inner: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    s: String;
    opt: Int?;
}

contract TestContract {
    foo: OuterMost = OuterMost{inner: Middle{inner: Inner{s:"text", opt:null}}};

    init() {
        self.foo = OuterMost{inner: Middle{inner: Inner{s:"text", opt:null}}};
    }

    receive() {
        dump(self.foo.inner.inner.s);
    }
}
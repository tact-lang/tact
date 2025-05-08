struct Blah {
    inner: Inner;
}

struct Inner {
    a: Int;
}

contract CrossNest {
    f: Blah;

    init() {
        self.f = Blah{inner: Inner{a:33}};
    }
}
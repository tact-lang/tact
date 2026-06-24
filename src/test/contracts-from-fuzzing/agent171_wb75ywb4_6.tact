struct NestedOpt {
    inner: Inner?
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestNestedOpt {
    nopt: NestedOpt;
    init() {
        self.nopt = NestedOpt{ inner: null };
    }
}
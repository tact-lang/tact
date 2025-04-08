struct DoubleOpt {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract OptInNested {
    f: DoubleOpt;

    init() {
        self.f = DoubleOpt{ inner: null };
    }
}
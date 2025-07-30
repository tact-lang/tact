struct InnerSt {
    foo: Int;
}

struct OuterSt {
    bar: InnerSt?;
}

contract OptNest {
    data: OuterSt?;

    init() {
        self.data = null;
    }
}
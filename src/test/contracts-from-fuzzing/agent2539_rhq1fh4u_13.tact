struct InnerMost {
    vv: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inr: Inner;
}

contract VeryDeep {
    data: Outer;

    init() {
        self.data = Outer{inr: Inner{im: InnerMost{vv: 42}}};
    }
}
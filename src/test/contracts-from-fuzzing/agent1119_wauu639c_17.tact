struct InnerMost {
    a: Int;
}

struct InnerMid {
    x: InnerMost;
}

struct Inner {
    y: InnerMid;
}

contract MultiStructContract {
    field: Inner;

    init() {
        self.field = Inner{y: InnerMid{x: InnerMost{a: 42}}};
    }
}
struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost?;
}

struct Mid {
    inr: Inner;
}

contract OptDeep {
    obj: Mid;

    init() {
        self.obj = Mid{ inr: Inner{ im: null } };
    }
}
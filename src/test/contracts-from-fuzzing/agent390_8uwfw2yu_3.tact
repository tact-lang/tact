struct Deep {
    inner: Inner;
}

struct Inner {
    n: Int;
    b: Bool;
    opt: Bool?;
}

contract DeeplyNested {
    d: Deep;

    init() {
        self.d = Deep{ inner: Inner{ n: 1, b: false, opt: null } };
    }
}

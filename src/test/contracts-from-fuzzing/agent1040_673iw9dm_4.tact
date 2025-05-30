struct InnerMost {
    z: Int;
}

struct Inner {
    y: Bool;
    im: InnerMost;
}

contract TestContract {
    outer: Inner;

    init() {
        self.outer = Inner{
            y: true,
            im: InnerMost{ z: 999 }
        };
    }
}
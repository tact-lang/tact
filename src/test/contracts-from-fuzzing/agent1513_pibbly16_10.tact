struct InnerMost {
    z: Int;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

contract OptionalInner {
    opt: Inner?;

    init() {
        self.opt = Inner{ x: 5, y: InnerMost{z:7} };
    }
}
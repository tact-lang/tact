struct L2 {
    a: Int;
}

struct L1 {
    inner: L2?;
}

contract OptInnerInner {
    f: L1?;

    init() {
        self.f = null;
    }
}
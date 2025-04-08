struct OptInner {
    b: Bool?;
}

struct OptMiddle {
    inner: OptInner?;
}

contract NestedOpts2 {
    mid: OptMiddle;

    init() {
        self.mid = OptMiddle{ inner: null };
    }
}

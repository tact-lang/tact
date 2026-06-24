struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    s: String?;
    inner: InnerMost;
}

contract OptMix {
    mid: Middle?;

    init() {
        self.mid = null;
    }
}

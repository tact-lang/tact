struct InnerLayer {
    a: Int?;
    b: Bool;
}

struct MidLayer {
    ref: InnerLayer;
}

contract OptInnerWrap {
    mid: MidLayer;

    init() {
        self.mid = MidLayer{ ref: InnerLayer{ a: null, b: true } };
    }
}

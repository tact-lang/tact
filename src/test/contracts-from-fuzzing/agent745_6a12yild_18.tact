struct InnerMost {
    x: Int;
}

struct MidOpt {
    inner: InnerMost?;
}

contract OptionalMidLevel {
    m: MidOpt;

    init() {
        self.m = MidOpt{ inner: null };
    }
}
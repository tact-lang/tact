struct InnerMost {
    value: Int? = null;
    text: String? = null;
}

struct MidLevel {
    inner: InnerMost = InnerMost{};
    optInner: InnerMost? = null;
}

struct TopLevel {
    mid: MidLevel = MidLevel{};
    optMid: MidLevel? = null;
}

contract DefaultsOpt {
    data: TopLevel?;

    init() {
        self.data = null;
    }
}
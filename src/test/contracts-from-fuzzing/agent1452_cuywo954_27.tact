struct InnerMostOpt {
    v: Int?;
}

struct MidOpt {
    inner: InnerMostOpt?;
}

contract CompoundOpt {
    data: MidOpt?;

    init() {
        self.data = MidOpt{
            inner: null
        };
    }
}

struct InnerMost {
    v: Int;
}

struct MidOpt {
    inn: InnerMost?;
}

contract NullableDeep {
    midopt: MidOpt?;

    init() {
        self.midopt = null;
    }
}
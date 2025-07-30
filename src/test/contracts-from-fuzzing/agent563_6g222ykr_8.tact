struct InnerMost {
    value: Int;
}

struct InnerOpt {
    maybe: InnerMost?;
}

struct MidOpt {
    maybeInner: InnerOpt?;
}

contract DeepNullInit {
    nested: MidOpt;

    init() {
        self.nested = MidOpt { maybeInner: null };
    }
}
struct InnerMost {
    v: Int;
}

struct MiddleOpt {
    s: String;
    m: InnerMost?;
}

contract NestedMix {
    d: MiddleOpt;

    init() {
        self.d = MiddleOpt{
            s: "hi",
            m: null
        };
    }
}
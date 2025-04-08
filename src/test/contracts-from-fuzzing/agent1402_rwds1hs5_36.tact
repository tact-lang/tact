struct DeepInner {
    ss: String;
    bb: Bool;
}

struct MidOpt {
    ii: Int;
    oo: DeepInner?;
}

contract OptMidNested {
    data: MidOpt;

    init() {
        self.data = MidOpt{ ii: 5, oo: null };
    }
}
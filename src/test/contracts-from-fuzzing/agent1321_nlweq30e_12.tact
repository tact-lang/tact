struct NestedOpt {
    inn: Int?;
}

struct ManyNestedOpt {
    n1: NestedOpt?;
    n2: NestedOpt?;
}

contract OptMix {
    f: ManyNestedOpt;

    init() {
        self.f = ManyNestedOpt{
            n1: NestedOpt{ inn: 5 },
            n2: null
        };
    }
}

struct OneOpt {
    opt: Int?;
}

struct TwoOpt {
    o1: OneOpt?;
    o2: OneOpt?;
}

contract NestedOptionals {
    f: TwoOpt;

    init() {
        self.f = TwoOpt{
            o1: null,
            o2: null,
        };
    }
}

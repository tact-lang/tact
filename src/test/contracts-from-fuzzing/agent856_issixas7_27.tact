struct InnerS {
    x: Int;
}

struct OuterS {
    i1: InnerS;
    optI: InnerS?;
}

contract OptionalsUpdate {
    s: OuterS;

    init() {
        self.s = OuterS{
            i1: InnerS{ x: 42 },
            optI: null
        };
        self.s.optI = InnerS{ x: 100 };
    }
}
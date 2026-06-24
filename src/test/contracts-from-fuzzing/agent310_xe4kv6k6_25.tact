struct InnerS {
    n: Int?;
}

struct OuterS {
    nest: InnerS;
}

contract StructResetTest {
    s: OuterS;

    init() {
        self.s = OuterS{ nest: InnerS{ n: null } };
        self.s = OuterS{ nest: InnerS{ n: 42 } };
    }
}
struct InnerS {
    flag: Bool;
}

struct OuterS {
    nestedOpt: InnerS?;
    ival: Int;
}

contract OptionalStructFieldInside {
    f: OuterS;

    init() {
        self.f = OuterS{
            nestedOpt: InnerS{ flag: true },
            ival: 77
        };
    }
}
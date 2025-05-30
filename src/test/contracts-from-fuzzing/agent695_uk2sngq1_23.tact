struct InnerS {
    x: Int;
}

struct MidS {
    v: Int;
    inner: InnerS;
}

struct OuterS {
    a: Bool;
    mid: MidS;
}

contract ComboDeep {
    f: OuterS;

    init() {
        self.f = OuterS{
            a: true,
            mid: MidS{
                v: 8,
                inner: InnerS{x:9},
            },
        };
    }
}
struct InnerS {
    x: Int;
    y: Bool;
}

struct OuterS {
    a: Int;
    b: Bool;
    c: InnerS?;
    d: Int;
}

contract OptMidStruct {
    store: OuterS;

    init() {
        self.store = OuterS{
            a: 42,
            b: true,
            c: null,
            d: 7
        };
    }
}
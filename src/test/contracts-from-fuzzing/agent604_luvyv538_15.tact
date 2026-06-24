struct InnerS {
    x: Int;
}

struct OuterS {
    y: Int;
    inner: InnerS;
}

contract MultiStructs {
    a: InnerS;
    b: OuterS;

    init() {
        self.a = InnerS{ x: 5 };
        self.b = OuterS{ y: 6, inner: InnerS{ x: 9 } };
    }
}
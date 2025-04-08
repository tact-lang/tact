struct InnerS {
    flag: Bool;
}

struct OuterS {
    inner: InnerS;
}

contract PersistSimpleNest {
    f: OuterS;

    init() {
        self.f = OuterS{ inner: InnerS{ flag: true } };
    }
}

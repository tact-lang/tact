struct InnerS {
    x: Int;
}

struct OuterS {
    inner: InnerS;
}

contract PersistOuterOpt {
    o: OuterS?;

    init() {
        self.o = null;
    }
}
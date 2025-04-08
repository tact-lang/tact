struct InnerS {
    p: Int as int8;
    q: Int as uint4;
}

struct OuterS {
    a: Int as uint32;
    b: InnerS;
}

contract Test {
    foo: OuterS;

    init() {
        self.foo = OuterS{
            a: 123,
            b: InnerS { p: -5, q:7 }
        };
    }
}
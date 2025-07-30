struct InnerS {
    foo: Int?;
}

struct OuterS {
    i: Int;
    s: InnerS?;
}

contract OuterInnerOpt {
    state: OuterS;

    init() {
        self.state = OuterS{
            i: 7,
            s: null
        };
    }
}
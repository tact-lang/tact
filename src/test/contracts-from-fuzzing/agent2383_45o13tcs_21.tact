struct InnerS {
    flag: Bool;
    text: String;
}

struct OuterS {
    s1: InnerS;
    optInner: InnerS?;
}

contract OptionalInner {
    state: OuterS;
    init() {
        self.state = OuterS {
            s1: InnerS{ flag: true, text: "x" },
            optInner: null
        };
    }
}
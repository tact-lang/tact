struct InnerS {
    val: Int;
}

struct OuterS {
    inner1: InnerS;
    inner2: InnerS;
}

contract SameStructTwice {
    data: OuterS;

    init() {
        self.data = OuterS{
            inner1: InnerS{ val: 1 },
            inner2: InnerS{ val: 2 },
        };
    }
}

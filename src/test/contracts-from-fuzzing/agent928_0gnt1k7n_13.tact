struct InnerS {
    val: Int?;
}

struct OuterS {
    a: InnerS?;
    b: InnerS;
}

contract TestCN {
    data: OuterS;

    init() {
        self.data = OuterS{
            a: null,
            b: InnerS{ val: 42 }
        };
    }
}
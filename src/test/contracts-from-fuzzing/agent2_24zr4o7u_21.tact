struct InnerS {
    a: Int;
    b: Bool;
}

struct MiddleS {
    inner: InnerS;
}

struct OuterS {
    middle: MiddleS;
}

contract StructChain {
    data: OuterS;

    init() {
        self.data = OuterS{
            middle: MiddleS{
                inner: InnerS{
                    a: 5,
                    b: true
                }
            }
        };
    }
}
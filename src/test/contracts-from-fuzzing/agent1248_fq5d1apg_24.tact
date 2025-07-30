struct InnerS {
    flag: Bool?;
}

struct MiddleS {
    inner: InnerS?;
}

struct OuterS {
    middle: MiddleS?;
}

contract NestedDistinctOptionals {
    s: OuterS;

    init() {
        self.s = OuterS{
            middle: MiddleS{
                inner: InnerS{
                    flag:true
                }
            }
        };
    }
}

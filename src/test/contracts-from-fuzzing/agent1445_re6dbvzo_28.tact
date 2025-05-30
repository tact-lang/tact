struct InnerMost {
    num: Int;
}

struct Middle {
    middleNum: Int;
    inner: InnerMost;
}

struct OuterMost {
    outerNum: Int;
    mid: Middle;
}

contract FullNestedChain {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            outerNum: 1,
            mid: Middle{
                middleNum: 2,
                inner: InnerMost{
                    num: 3,
                },
            },
        };
    }
}
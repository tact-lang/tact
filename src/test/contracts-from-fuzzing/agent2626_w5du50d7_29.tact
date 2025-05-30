struct InnerMost {
    deepInt: Int;
    deepOpt: Int?;
}

struct Middle {
    middleInt: Int;
    inner: InnerMost;
}

struct OuterWrap {
    outerInt: Int;
    mid: Middle;
}

contract DeepMixedNest {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            outerInt: 1,
            mid: Middle{
                middleInt: 2,
                inner: InnerMost{
                    deepInt: 3,
                    deepOpt: null
                }
            }
        };
    }
}
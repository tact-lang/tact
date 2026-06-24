struct InnerMost {
    x: Int;
}

struct InnerWrap {
    inner: InnerMost;
}

struct Middle {
    innerWrap: InnerWrap;
}

struct OuterMost {
    middle: Middle;
}

contract VeryDeep {
    dep: OuterMost;

    init() {
        self.dep = OuterMost{
            middle: Middle{
                innerWrap: InnerWrap{
                    inner: InnerMost{
                        x: 111
                    }
                }
            }
        };
    }
}

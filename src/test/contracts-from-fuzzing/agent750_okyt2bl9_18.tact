struct InnerMost {
    str: String;
}

struct Middle {
    inners: InnerMost;
}

struct OuterMost {
    m: Middle;
}

contract LotsOfNestedStrings {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m: Middle{
                inners: InnerMost{
                    str: "deep string"
                }
            }
        };
    }
}

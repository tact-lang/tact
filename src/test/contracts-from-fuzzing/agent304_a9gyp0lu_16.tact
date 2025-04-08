struct StrNest {
    inner1: String;
    inner2: String?;
}

struct MoreNest {
    m1: StrNest;
    m2: StrNest?;
    flag: Bool;
}

contract NestedStrings {
    nested: MoreNest;
    init() {
        self.nested = MoreNest{
            m1: StrNest{ inner1:"hi", inner2:null },
            m2: null,
            flag: true
        };
    }
}

struct SDeep {
    d1: Int;
    d2: Bool?;
}

struct SMid {
    mid1: SDeep;
    mid2: Int?;
}

struct STop {
    top1: Int;
    top2: SMid;
}

contract NestedOptionalTest {
    myState: STop;

    init() {
        self.myState = STop {
            top1: 42,
            top2: SMid {
                mid1: SDeep { d1: 1, d2: null },
                mid2: 2
            }
        };
    }
}
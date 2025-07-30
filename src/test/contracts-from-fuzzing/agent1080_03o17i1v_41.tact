struct LargeNested {
    aa: Int;
    bb: Int;
    cc: Int;
    dd: NestedInner;
}

struct NestedInner {
    ee: Int;
    ff: Int;
    gg: Int;
    hh: NestedInnermost;
}

struct NestedInnermost {
    ii: Int;
    jj: Int;
}

contract ComplexNested {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            aa: 1,
            bb: 2,
            cc: 3,
            dd: NestedInner{
                ee: 4,
                ff: 5,
                gg: 6,
                hh: NestedInnermost{
                    ii: 7,
                    jj: 8,
                },
            }
        };
    }
}
struct InnerMost {
    z: Int;
    flag: Bool?;
}

struct Middle {
    note: String;
    inner: InnerMost;
}

struct OuterMost {
    label: String;
    mid: Middle;
    moreFlag: Bool?;
}

contract HugeNestedWithOptional {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            label: "outer",
            mid: Middle{
                note: "middle",
                inner: InnerMost{ z: 42, flag: null }
            },
            moreFlag: true
        };
    }
}
struct InnerMost {
    flag: Bool;
}

struct Middle {
    count: Int;
    mflag: Bool;
    deep: InnerMost;
}

contract NestedStructs {
    mid: Middle;
    init() {
        self.mid = Middle{count: 7, mflag: true, deep: InnerMost{flag: false}};
    }
}
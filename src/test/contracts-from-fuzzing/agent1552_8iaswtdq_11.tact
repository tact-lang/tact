struct InnerMost {
    val: Int;
    opt: Bool?;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct TopMost {
    mid: Middle;
    amount: Int;
}

contract NestedComplex {
    value: TopMost;

    init() {
        self.value = TopMost{
            mid: Middle{
                inner: InnerMost{val:999,opt:null},
                flag:true
            },
            amount: 555
        };
    }
}
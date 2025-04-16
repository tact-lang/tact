struct InnerMost {
    flag: Bool;
}

struct Middle {
    nested1: InnerMost;
    nested2: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract NestedMultiFields {
    nf: Outer;

    init() {
        self.nf = Outer{
            mid: Middle{
                nested1: InnerMost{flag:true},
                nested2: InnerMost{flag:false}
            }
        };
    }
}
struct DeepNested {
    lvl1: Int;
    lvl2: InnerMost;
}

struct InnerMost {
    flag1: Bool;
    flag2: Bool?;
    num: Int;
}

contract TestContract {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            lvl1: 11,
            lvl2: InnerMost{
                flag1: true,
                flag2: null,
                num: 42
            }
        };
    }
}
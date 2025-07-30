struct InnerMost {
    val: Int = 0;
}

struct L2 {
    lvl2: InnerMost;
}

struct L1 {
    lvl1: L2;
}

contract NestedDefaultsDeep {
    x: L1;

    init() {
        self.x = L1{
            lvl1: L2{
                lvl2: InnerMost{}
            }
        };
    }
}

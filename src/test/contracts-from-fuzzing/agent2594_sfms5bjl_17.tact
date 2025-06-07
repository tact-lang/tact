struct NestedManyLevels {
    lvl1: Int;
    lvl2: L2;
}

struct L2 {
    lvl2_val: Int;
    lvl3: L3;
}

struct L3 {
    text: String;
    lvl4: L4;
}

struct L4 {
    flag: Bool;
    fin: Int;
}

contract FourDeep {
    store: NestedManyLevels;

    init() {
        self.store = NestedManyLevels{
            lvl1: 1,
            lvl2: L2{
                lvl2_val:2,
                lvl3: L3{
                    text: "x",
                    lvl4: L4{
                        flag:true,
                        fin:99
                    }
                }
            }
        };
    }
}
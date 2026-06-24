struct VeryDeep {
    lvl4: Int;
}

struct Deep3 {
    lvl3: VeryDeep;
}

struct Deep2 {
    lvl2: Deep3;
}

struct Deep1 {
    lvl1: Deep2;
}

contract DeepNested {
    data: Deep1;

    init() {
        self.data = Deep1{
            lvl1: Deep2{
                lvl2: Deep3{
                    lvl3: VeryDeep{ lvl4: 42 }
                }
            }
        };
    }
}
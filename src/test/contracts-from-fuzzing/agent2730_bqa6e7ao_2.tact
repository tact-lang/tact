struct DeepNested {
    lvl1: L1;
}

struct L1 {
    lvl2: L2;
}

struct L2 {
    lvl3: L3;
}

struct L3 {
    val: Int?;
}

contract DeepNestTest {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            lvl1: L1{
                lvl2: L2{
                    lvl3: L3{ val: null }
                }
            }
        };
    }
}
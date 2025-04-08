struct Deep {
    lvl1: L1;
}

struct L1 {
    lvl2: L2;
    lvl2opt: L2?;
}

struct L2 {
    lvl3: L3;
}

struct L3 {
    val: Int;
    desc: String?;
}

contract StorageTest {
    state: Deep;

    init() {
        self.state = Deep{
            lvl1: L1{
                lvl2: L2{
                    lvl3: L3{val: 1, desc: "ok"},
                },
                lvl2opt: null
            }
        };
    }
}
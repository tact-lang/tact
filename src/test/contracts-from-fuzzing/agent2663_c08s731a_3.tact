struct Deep {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    value: Int;
}

contract DeepNestedStorage {
    data: Deep;

    init() {
        self.data = Deep{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        value: 100
                    }
                }
            }
        };
    }
}
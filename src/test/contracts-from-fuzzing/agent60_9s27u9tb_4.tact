struct DeepNest4 {
    lvl4: Int = 4;
}

struct DeepNest3 {
    lvl3: DeepNest4;
}

struct DeepNest2 {
    lvl2: DeepNest3;
}

struct DeepNest1 {
    lvl1: DeepNest2;
}

contract DeepContract {
    info: DeepNest1;

    init() {
        self.info = DeepNest1{
            lvl1: DeepNest2{
                lvl2: DeepNest3{
                    lvl3: DeepNest4{ lvl4: 42 }
                }
            }
        };
    }
}
struct Level3 {
    l3: Int?;
}

struct Level2 {
    l2: Level3?;
}

struct Level1 {
    l1: Level2?;
}

contract DeeplyOpt {
    opt: Level1;

    init() {
        self.opt = Level1 {
            l1: null
        };
    }
}

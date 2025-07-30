struct DeepOptionalNest {
    lvl1: Level1?;
}

struct Level1 {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level3 {
    value: Int?;
}

contract TestContract {
    data: DeepOptionalNest;
    init() {
        self.data = DeepOptionalNest{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{ value: null }
                }
            }
        };
    }
}
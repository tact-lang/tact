struct OptInDeep {
    sub1: Level1?;
}

struct Level1 {
    sub2: Level2?;
}

struct Level2 {
    sub3: Level3?;
}

struct Level3 {
    val: Int?;
}

contract DeepOptionals {
    field: OptInDeep;
    init() {
        self.field = OptInDeep{
            sub1: Level1{
                sub2: Level2{
                    sub3: null
                }
            }
        };
    }
}

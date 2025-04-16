struct MixNestedOptionals {
    level1: Level1?;
}

struct Level1 {
    inner1: Int?;
    level2: Level2?;
}

struct Level2 {
    inner2: Bool?;
    level3: Level3?;
}

struct Level3 {
    inner3: String?;
}

contract Test {
    data: MixNestedOptionals;

    init() {
        self.data = MixNestedOptionals{
            level1: Level1{
                inner1: null,
                level2: Level2{
                    inner2: null,
                    level3: Level3{
                        inner3: null
                    }
                }
            }
        };
    }
}
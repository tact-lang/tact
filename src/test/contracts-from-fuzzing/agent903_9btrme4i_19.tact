struct DeepOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    foo: Int;
}

contract DeepOptionals {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{
            level1: Level1{
                level2: Level2{
                    level3: Level3{foo:42}
                }
            }
        };
    }
}
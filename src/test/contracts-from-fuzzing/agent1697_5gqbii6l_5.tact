struct DeepOptional {
    level1: LevelOpt1?;
}

struct LevelOpt1 {
    level2: LevelOpt2?;
}

struct LevelOpt2 {
    level3: LevelOpt3?;
}

struct LevelOpt3 {
    val: Int?;
}

contract TestContract {
    nestedOpt: DeepOptional;

    init() {
        self.nestedOpt = DeepOptional{
            level1: LevelOpt1{
                level2: LevelOpt2{
                    level3: LevelOpt3{
                        val: null
                    }
                }
            }
        };
    }
}
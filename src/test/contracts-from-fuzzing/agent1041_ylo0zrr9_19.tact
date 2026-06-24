struct DeepOpts {
    level1: LevelOpt1?;
}

struct LevelOpt1 {
    level2: LevelOpt2?;
    value: Int;
}

struct LevelOpt2 {
    level3: LevelOpt3?;
    flag: Bool;
}

struct LevelOpt3 {
    str: String;
}

contract DeepOptionalLayers {
    field: DeepOpts;

    init() {
        self.field = DeepOpts{
            level1: LevelOpt1{
                level2: null,
                value: 10
            }
        };
    }
}

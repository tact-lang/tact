struct MultiLayerOpt {
    level1: LevelOpt1?;
}

struct LevelOpt1 {
    level2: LevelOpt2?;
}

struct LevelOpt2 {
    level3: LevelOpt3?;
}

struct LevelOpt3 {
    v: Int;
    s: String;
}

contract TestContract {
    data: MultiLayerOpt = MultiLayerOpt{ level1: null };

    init() {
        self.data = MultiLayerOpt{
            level1: LevelOpt1{
                level2: LevelOpt2{
                    level3: LevelOpt3{
                        v: 888,
                        s: "deep"
                    }
                }
            }
        };
    }
}

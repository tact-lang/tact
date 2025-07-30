struct OptionalNest {
    innerOpt: LevelOpt?;
}

struct LevelOpt {
    valOpt: Level2Opt?;
}

struct Level2Opt {
    val: Int?;
}

contract OptContract {
    nestedOpt: OptionalNest;

    init() {
        self.nestedOpt = OptionalNest{
            innerOpt: LevelOpt{
                valOpt: Level2Opt{
                    val: null
                }
            }
        };
    }
}

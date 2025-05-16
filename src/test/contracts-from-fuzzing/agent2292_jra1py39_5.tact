struct Level3 {
    deepVal: Int;
}

struct Level2 {
    innerOpt: Level3?;
}

struct Level1 {
    midOpt: Level2?;
}

contract DeepOptionalChain {
    data: Level1?;

    init() {
        self.data = Level1{
            midOpt: Level2{
                innerOpt: Level3{
                    deepVal: 99
                }
            }
        };
    }
}
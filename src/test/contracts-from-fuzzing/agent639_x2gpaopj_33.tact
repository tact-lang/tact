struct OptionalChain {
    innerOpt: Level1?;
}

struct Level1 {
    nextOpt: Level2?;
}

struct Level2 {
    lastVal: Int?;
}

contract OptChain {
    c: OptionalChain;
    init() {
        self.c = OptionalChain{
            innerOpt: Level1{
                nextOpt: Level2{ lastVal:null }
            }
        };
    }
}
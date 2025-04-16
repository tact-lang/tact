struct DeeplyOptional {
    foo: Int?;
}

struct LevelOpt2 {
    inner: DeeplyOptional?;
}

struct LevelOpt1 {
    lev2: LevelOpt2?;
}

contract MultiOptionalDepth {
    d: LevelOpt1;

    init() {
        self.d = LevelOpt1{
            lev2: LevelOpt2{
                inner: null
            }
        };
    }
}
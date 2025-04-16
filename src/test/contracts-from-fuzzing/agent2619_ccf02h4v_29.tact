struct DeepOpt {
    sub: DeeperOpt?;
}

struct DeeperOpt {
    sub: DeepestOpt?;
}

struct DeepestOpt {
    val: Int?;
}

contract OptionalNested {
    s: DeepOpt;
    init() {
        self.s = DeepOpt{
            sub: DeeperOpt{
                sub: DeepestOpt{ val: null }
            }
        };
    }
}
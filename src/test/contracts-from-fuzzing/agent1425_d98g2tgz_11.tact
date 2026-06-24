// deeply nested optionals with defaults
struct DeepOpt {
    sub: SubOpt?;
}

struct SubOpt {
    level2: Level2Opt?;
}

struct Level2Opt {
    x: Int = 5;
}

contract DeepOptStorage {
    data: DeepOpt;
    init() {
        self.data = DeepOpt{ sub: null };
    }
}
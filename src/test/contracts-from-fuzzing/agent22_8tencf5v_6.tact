struct DeepOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    num: Int;
    flag: Bool;
}

contract DeepOptContract {
    state: DeepOpt;

    init() {
        self.state = DeepOpt{
            level1: null
        };
    }
}
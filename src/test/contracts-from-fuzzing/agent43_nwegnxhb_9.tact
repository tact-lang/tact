struct DeepOpt {
    level1: LevelOpt?;
}

struct LevelOpt {
    level2: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract TestContract {
    val: DeepOpt = DeepOpt{
        level1: null
    };
    receive() {
        let _ = self.val;
    }
}
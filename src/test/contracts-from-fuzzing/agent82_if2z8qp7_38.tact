struct DeepOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    a: Int?;
    b: String?;
}

contract Test {
    data: DeepOpt;

    init() {
        self.data = DeepOpt { level1: null };
    }
}
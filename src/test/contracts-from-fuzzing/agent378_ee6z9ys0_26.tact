struct MultiLevelOpt {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    x: Int?;
}

contract TestContract {
    val: MultiLevelOpt;

    init() {
        self.val = MultiLevelOpt { level1: null };
    }
}
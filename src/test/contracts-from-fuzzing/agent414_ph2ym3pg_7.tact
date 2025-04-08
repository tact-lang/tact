struct Level3 {
    val: Int;
}

struct Level2 {
    valopt: Level3?;
}

struct Level1 {
    next: Level2?;
}

contract MultiLevelOptional {
    root: Level1?;
    init() {
        self.root = null;
    }
}

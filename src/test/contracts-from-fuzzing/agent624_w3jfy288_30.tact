struct Level3 {
    z: Int?;
}

struct Level2 {
    level3: Level3?;
}

struct Level1 {
    level2: Level2?;
}

contract DeepOptionalLevels {
    root: Level1?;

    init() {
        self.root = null;
    }
}
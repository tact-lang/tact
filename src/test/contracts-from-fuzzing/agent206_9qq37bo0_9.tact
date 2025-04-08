struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    val: Int?;
}

contract DeepOption {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2: null
        };
    }
}

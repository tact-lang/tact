struct DeeplyOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
    num: Int = 1;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    flag: Bool?;
    text: String?;
}

contract DeepOptionalContract {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{ level1: null };
    }
}
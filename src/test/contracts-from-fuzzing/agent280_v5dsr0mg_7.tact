struct Level3 {
    deepOpt: Int?;
}

struct Level2 {
    level3: Level3?;
}

struct Level1 {
    level2: Level2?;
}

contract OptDeep {
    storage: Level1;

    init() {
        self.storage = Level1{
            level2: Level2{
                level3: Level3{
                    deepOpt: null,
                },
            },
        };
    }
}
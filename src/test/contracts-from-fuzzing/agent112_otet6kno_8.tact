struct DeepOpt {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
    level6: Int?;
    level7: Int?;
    level8: Int?;
    level9: Int?;
    level10: Int?;
}

contract ManyOptionals {
    vals: DeepOpt = DeepOpt{
        level1: null,
        level2: null,
        level3: null,
        level4: null,
        level5: null,
        level6: null,
        level7: null,
        level8: null,
        level9: null,
        level10: null
    };

    init() {
        self.vals = DeepOpt{
            level1: 1,
            level2: 2,
            level3: 3,
            level4: 4,
            level5: 5,
            level6: 6,
            level7: 7,
            level8: 8,
            level9: 9,
            level10: 10
        };
    }
}

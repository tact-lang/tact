struct Level3 {
    flag: Bool;
}

struct Level2 {
    level3: Level3;
    num: Int;
}

struct Level1 {
    level2: Level2;
    optText: String?;
}

contract DeeplyNestedStorage {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2: Level2{
                level3: Level3{ flag: true },
                num: 42
            },
            optText: null
        };
    }
}
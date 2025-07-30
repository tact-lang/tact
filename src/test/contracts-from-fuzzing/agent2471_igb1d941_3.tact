struct DeeplyNested {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    num: Int;
}

contract DeepNestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level2: Level2{
                level3: Level3{
                    num: 777,
                },
            },
        };
    }
}
struct DeepNested {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    flag: Bool;
    count: Int?;
}

contract DeepContract {
    record: DeepNested;

    init() {
        self.record = DeepNested{
            level2: Level2{
                level3: Level3{
                    flag: false,
                    count: null
                }
            }
        };
    }
}

struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    value: Int?;
    flag: Bool;
}

contract TestDeep {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: Level1{
                level2: Level2{
                    value: 42,
                    flag: true
                }
            }
        };
    }
}
struct DeepNested {
    value: Int = 42;
}

struct Level2 {
    nested: DeepNested;
}

struct Level1 {
    level2: Level2;
}

contract DeepStorage {
    state: Level1;

    init() {
        self.state = Level1{
            level2: Level2{
                nested: DeepNested{ value: 99 },
            },
        };
    }
}
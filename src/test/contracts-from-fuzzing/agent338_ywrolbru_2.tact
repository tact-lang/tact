struct DeepNest {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    num: Int;
    flag: Bool?;
}

contract Test {
    store: DeepNest;

    init() {
        self.store = DeepNest{
            level1: Level1{
                level2: Level2{
                    num: 123,
                    flag: null,
                },
            },
        };
    }
}
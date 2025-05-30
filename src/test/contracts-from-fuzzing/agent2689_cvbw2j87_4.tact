struct DeepNested {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    token: Int;
    level3: Level3;
}

struct Level3 {
    flag: Bool;
    message: String;
}

contract DeepNestTest {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            level1: 1,
            level2: Level2{
                token: 2,
                level3: Level3{
                    flag: true,
                    message: "hello",
                },
            },
        };
    }
}
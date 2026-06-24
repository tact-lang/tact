struct DeepNest {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    flag: Bool;
    lvl3: Level3;
}

struct Level3 {
    name: String;
}

contract Test {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            level1: 7,
            level2: Level2{
                flag: false,
                lvl3: Level3{
                    name: "hello"
                }
            }
        };
    }
}
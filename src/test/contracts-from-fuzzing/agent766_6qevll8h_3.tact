struct DeepNest {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    num: Int;
    flag: Bool;
}

contract Test {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            level1: Level1{
                level2: Level2{
                    num: 999,
                    flag: true
                }
            }
        };
    }
}
struct DeepNested {
    level1: Int;
    optLevel2: Level2?;
}

struct Level2 {
    level2val: Int;
    level3: Level3;
}

struct Level3 {
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 1,
            optLevel2: Level2{
                level2val: 2,
                level3: Level3{ flag: true }
            }
        };
    }
}
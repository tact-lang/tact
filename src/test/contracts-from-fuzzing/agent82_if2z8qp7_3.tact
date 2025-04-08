struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: Level1{
                level2: Level2{
                    value: 10,
                    flag: false
                }
            }
        };
    }
}
struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    value: Int;
}

contract DeepTest {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            level1: Level1{
                level2: Level2{
                    value: 42
                }
            }
        };
    }
}
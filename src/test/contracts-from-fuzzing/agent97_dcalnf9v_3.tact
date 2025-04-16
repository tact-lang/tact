struct Level3 {
    deepVal: Int;
}

struct Level2 {
    deeper: Level3;
}

struct Level1 {
    stillDeeper: Level2;
}

contract DeepNestTest {
    deepField: Level1;
    init() {
        self.deepField = Level1{
            stillDeeper: Level2{
                deeper: Level3{
                    deepVal: 999
                }
            }
        };
    }
}
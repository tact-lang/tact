struct NestedS {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
    optLevel2: Level2?;
}

struct Level2 {
    level3_1: Level3;
    level3_2: Level3;
    optLevel3: Level3?;
}

struct Level3 {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
}

contract DeepStructStorage {
    data: NestedS;

    init() {
        self.data = NestedS{
            level1: Level1{
                level2: Level2{
                    level3_1: Level3{a:1, b:2, c:true},
                    level3_2: Level3{a:3, b:4, c:false},
                    optLevel3: null,
                },
                optLevel2: null,
            }
        };
    }
}

struct DeepStruct {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    leaf: Int;
}

contract ManyNestingsTest {
    data: DeepStruct;

    init() {
        self.data = DeepStruct{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        leaf: 42
                    }
                }
            }
        };
    }
}
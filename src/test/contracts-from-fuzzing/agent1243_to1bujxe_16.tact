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
    level4: Int;
}

contract Test {
    foo: DeepStruct;
    init() {
        self.foo = DeepStruct{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: 123
                    }
                }
            }
        };
    }
}
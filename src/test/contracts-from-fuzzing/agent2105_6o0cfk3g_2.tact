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
    x: Int;
    y: Bool;
}

contract TestContract {
    s: DeepStruct;

    init() {
        self.s = DeepStruct{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        x: 42,
                        y: true,
                    }
                }
            }
        };
    }
}
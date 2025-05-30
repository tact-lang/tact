struct MultiLayer {
    level1: Level1;
}

struct Level1 {
    x: Int;
    level2: Level2;
}

struct Level2 {
    y: Bool;
    level3: Level3;
}

struct Level3 {
    flag: Bool?;
    z: Int;
}

contract MultiLayered {
    m: MultiLayer;

    init() {
        self.m = MultiLayer{
            level1: Level1{
                x: 5,
                level2: Level2{
                    y: false,
                    level3: Level3{
                        flag: null,
                        z: 99,
                    }
                }
            }
        };
    }
}

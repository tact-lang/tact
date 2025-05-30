struct VeryDeep {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    num: Int;
    flag: Bool;
}

contract Test5 {
    data: VeryDeep;

    init() {
        self.data = VeryDeep{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        num: 7,
                        flag: true,
                    }
                }
            }
        };
    }
}
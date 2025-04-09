struct BigChain {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    level5: Level5;
}

struct Level5 {
    finalVal: Int;
}

contract Test12 {
    big: BigChain;
    init() {
        self.big = BigChain{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            level5: Level5{
                                finalVal: 42
                            }
                        }
                    }
                }
            }
        };
    }
}
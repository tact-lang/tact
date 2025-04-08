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
    value: Int;
}

contract DeepNest5 {
    data: Level1;

    init() {
        self.data = Level1{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        level5: Level5{
                            value: 123
                        }
                    }
                }
            }
        };
    }
}
struct DeepNest {
    x: Level1;
}

struct Level1 {
    x: Level2;
}

struct Level2 {
    x: Level3;
}

struct Level3 {
    x: Level4;
}

struct Level4 {
    x: Level5;
}

struct Level5 {
    x: Int;
}

contract TestStorage {
    myDeep: DeepNest;

    init() {
        self.myDeep = DeepNest{
            x: Level1{
                x: Level2{
                    x: Level3{
                        x: Level4{
                            x: Level5{
                                x: 7
                            }
                        }
                    }
                }
            }
        };
    }
}

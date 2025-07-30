struct Level1 {
    x1: Int;
}
struct Level2 {
    x2: Level1;
}
struct Level3 {
    x3: Level2;
}
struct Level4 {
    x4: Level3;
}
struct Level5 {
    x5: Level4;
}
struct Level6 {
    x6: Level5;
}
struct Level7 {
    x7: Level6;
}
struct Level8 {
    x8: Level7;
}

contract EightDeepChain {
    storage: Level8;

    init() {
        self.storage = Level8{
            x8: Level7{
                x7: Level6{
                    x6: Level5{
                        x5: Level4{
                            x4: Level3{
                                x3: Level2{
                                    x2: Level1{
                                        x1: 10
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
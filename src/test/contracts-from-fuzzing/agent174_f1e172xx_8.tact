struct VeryDeepNested {
    level1: Level1;
}

struct Level1 { level2: Level2; }
struct Level2 { level3: Level3; }
struct Level3 { level4: Level4; }
struct Level4 { level5: Level5; }
struct Level5 { value: Int; }

contract TestContract {
    data: VeryDeepNested;

    init() {
        self.data = VeryDeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            level5: Level5{
                                value: 99
                            }
                        }
                    }
                }
            }
        };
    }
}
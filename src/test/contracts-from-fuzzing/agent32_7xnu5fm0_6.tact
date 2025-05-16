struct OneBigChain {
    nested: Level1;
}

struct Level1 {
    nested: Level2;
}

struct Level2 {
    nested: Level3;
}

struct Level3 {
    nested: Level4;
}

struct Level4 {
    nested: Level5;
}

struct Level5 {
    value: Int;
}

contract TestContract {
    val: OneBigChain;
    init() {
        self.val = OneBigChain{
            nested: Level1{
                nested: Level2{
                    nested: Level3{
                        nested: Level4{
                            nested: Level5{
                                value: 123
                            }
                        }
                    }
                }
            }
        };
    }
}
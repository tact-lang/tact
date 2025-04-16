struct Level1 {
    Value: Int;
}

struct Level2 {
    L1: Level1;
}

struct Level3 {
    L2: Level2;
}

struct Level4 {
    L3: Level3;
}

struct Level5 {
    L4: Level4;
}

contract TestDeepNested {
    receive() {
        let s: Level5 = Level5{
            L4: Level4{
                L3: Level3{
                    L2: Level2{
                        L1: Level1{ Value: 99 }
                    }
                }
            }
        };
        let dummy: Int = s.L4.L3.L2.L1.Value;
    }
}

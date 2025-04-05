struct Level5 {
    val: Int;
}

struct Level4 {
    l5: Level5;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestDeepChain {
    init() {
        let d: Level1 = Level1 {
            l2: Level2 {
                l3: Level3 {
                    l4: Level4 {
                        l5: Level5 { val: 42 }
                    }
                }
            }
        };
        d;
    }
}

struct Level5 { V: Int; }

struct Level4 { 
    L5: Level5; 
    V: Int; 
}

struct Level3 { 
    L4: Level4; 
    V: Int; 
}

struct Level2 { 
    L3: Level3; 
    V: Int; 
}

struct Level1 { 
    L2: Level2; 
    V: Int; 
}

contract TestDeepChain {
    receive() {
        let chain: Level1 = Level1 {
            L2: Level2 {
                L3: Level3 {
                    L4: Level4 {
                        L5: Level5 { V: 5 },
                        V: 4
                    },
                    V: 3
                },
                V: 2
            },
            V: 1
        };
    }
}

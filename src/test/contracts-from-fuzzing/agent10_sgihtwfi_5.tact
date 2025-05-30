struct Level5 {
    value: Int as uint16;
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

contract Test {
    receive() {
        let x = Level1 {
            l2: Level2 {
                l3: Level3 {
                    l4: Level4 {
                        l5: Level5 { value: 42 }
                    }
                }
            }
        };
    }
}

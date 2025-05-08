struct Level5 {
    value: Int;
}

struct Level4 {
    value: Int;
    level5: Level5;
}

struct Level3 {
    value: Int;
    level4: Level4;
}

struct Level2 {
    value: Int;
    level3: Level3;
}

struct Level1 {
    value: Int;
    level2: Level2;
}

contract TestDeepChain {
    receive() {
        let instance = Level1 {
            value: 1,
            level2: Level2 {
                value: 2,
                level3: Level3 {
                    value: 3,
                    level4: Level4 {
                        value: 4,
                        level5: Level5 { value: 5 }
                    }
                }
            }
        };
        return;
    }
}

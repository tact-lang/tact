struct NestedLevels {
    lvl1: Level2;
}

struct Level2 {
    lvl2: Level3;
}

struct Level3 {
    lvl3: Level4;
}

struct Level4 {
    lvl4: Level5;
}

struct Level5 {
    finalVal: Int;
}

contract DeepNesting5 {
    data: NestedLevels;

    init() {
        self.data = NestedLevels{
            lvl1: Level2 {
                lvl2: Level3 {
                    lvl3: Level4 {
                        lvl4: Level5 {
                            finalVal: 55
                        }
                    }
                }
            }
        };
    }
}

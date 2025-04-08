struct DeepNested {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    level2Int: Int;
    level3: Level3;
}

struct Level3 {
    level3Int: Int;
    level4: Level4;
}

struct Level4 {
    level4Int: Int;
}

contract DeepNestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 1,
            level2: Level2{
                level2Int: 2,
                level3: Level3{
                    level3Int: 3,
                    level4: Level4{level4Int: 4}
                }
            }
        };
    }
}
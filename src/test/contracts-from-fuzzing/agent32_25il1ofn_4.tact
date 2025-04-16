struct DeeplyNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    value: Int;
}

contract TestContract {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            value: 123
                        }
                    }
                }
            }
        };
    }
}

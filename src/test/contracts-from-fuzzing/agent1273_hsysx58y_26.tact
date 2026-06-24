struct DeepOptional {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    level4: Level4?;
}

struct Level4 {
    value: Int;
}

contract TestContract {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        value: 42
                    }
                }
            }
        };
    }
}
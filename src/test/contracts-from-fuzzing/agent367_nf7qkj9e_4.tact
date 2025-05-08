struct Level4 {
    data: Int;
}

struct Level3 {
    level4: Level4?;
}

struct Level2 {
    level3: Level3?;
}

struct Level1 {
    level2: Level2?;
}

contract TestDeepOptional {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        data: 777,
                    }
                }
            }
        };
    }
}
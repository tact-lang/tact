struct MultipleLevels {
    l1: Level1;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level3 {
    v1: Int;
    v2: Bool;
}

contract MultiNestedMultipleBranches {
    root: MultipleLevels;

    init() {
        self.root = MultipleLevels{
            l1: Level1{
                l2a: Level2{
                    l3a: Level3{ v1:1, v2:true },
                    l3b: Level3{ v1:2, v2:false },
                },
                l2b: Level2{
                    l3a: Level3{ v1:3, v2:true },
                    l3b: Level3{ v1:4, v2:false },
                }
            }
        };
    }
}

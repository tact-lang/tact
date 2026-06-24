struct DeeplyNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    value: Int;
    description: String;
}

contract TestContract {
    dn: DeeplyNested;

    init() {
        self.dn = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        value: 99,
                        description: "deep"
                    }
                }
            }
        };
    }
}
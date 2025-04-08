struct Level3 {
    value: Int?;
}

struct Level2 {
    level3: Level3?;
    name: String;
}

struct Level1 {
    level2: Level2?;
}

contract OptionalChain {
    nested: Level1?;

    init() {
        self.nested = Level1{
            level2: Level2{
                level3: Level3{
                    value: 7
                },
                name: "x"
            }
        };
    }
}
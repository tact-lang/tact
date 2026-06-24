struct OptionalNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    leaf: Int?;
}

contract FuzzOptNested {
    persistent: OptionalNested;

    init() {
        self.persistent = OptionalNested {
            level1: Level1 {
                level2: Level2 {
                    leaf: 321
                }
            }
        };
    }
}

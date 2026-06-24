struct OptionalNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    value: Int?;
}

contract OptTest {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{
            level1: Level1{
                level2: Level2{
                    value: null
                }
            }
        };
    }
}
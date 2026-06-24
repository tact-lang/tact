struct BigNestedOptionals {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
    fixed: Int;
}

struct Level2 {
    message: String?;
    flag: Bool?;
}

contract BigOptionalTest {
    stuff: BigNestedOptionals;

    init() {
        self.stuff = BigNestedOptionals{
            level1: Level1{
                level2: Level2{
                    message: null,
                    flag: true
                },
                fixed: 900
            }
        };
    }
}

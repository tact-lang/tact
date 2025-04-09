struct Level3 {
    val: Int;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract DeeplyNestedStructs {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2: Level2{
                level3: Level3{
                    val: 42
                }
            }
        };
    }
}
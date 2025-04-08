struct Level3 {
    level3Field: Int;
}

struct Level2 {
    level2Field: Level3;
}

struct Level1 {
    level1Field: Level2;
}

contract MultiNestedContract {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            level1Field: Level2{
                level2Field: Level3{
                    level3Field: 42
                }
            }
        };
    }
}
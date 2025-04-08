struct Level3 {
    finalVal: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepThreeLevelNest {
    field: Level1;

    init() {
        self.field = Level1{
            nested: Level2{
                nested: Level3{
                    finalVal: 123,
                },
            },
        };
    }
}
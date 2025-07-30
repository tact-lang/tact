struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Int;
    nested3: Level3;
}

struct Level1 {
    x: Int;
    nested2: Level2;
}

contract DeepNestedStruct {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            x: 1,
            nested2: Level2{
                y: 2,
                nested3: Level3{
                    z: null,
                },
            },
        };
    }
}
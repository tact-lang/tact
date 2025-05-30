struct Level3 {
    deepVal: Int?;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract DeepNestedStruct {
    field: Level1;

    init() {
        self.field = Level1{
            top: Level2 {
                mid: Level3 {
                    deepVal: null
                }
            }
        };
    }
}
struct NestedOptionalStruct {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    leaf: Int?;
}

contract DeepOptionalTest {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            level1: null
        };
    }
}